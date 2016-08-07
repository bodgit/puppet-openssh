require 'spec_helper_acceptance'

describe 'openssh::server::ldap' do
  case fact('osfamily')
  when 'RedHat'
    group   = 'root'
    ldap    = '/usr/libexec/openssh/ssh-ldap-wrapper'
    package = 'openssh-ldap'
  when 'OpenBSD'
    group   = 'wheel'
    ldap    = '/usr/local/libexec/ssh-ldap-wrapper'
    package = 'ssh-ldap-helper'
  end

  it 'should work with no errors' do

    pp = <<-EOS
      Package {
        source => $::osfamily ? {
          # $::architecture fact has gone missing on facter 3.x package currently installed
          'OpenBSD' => "http://ftp.openbsd.org/pub/OpenBSD/${::operatingsystemrelease}/packages/amd64/",
          default   => undef,
        },
      }

      include ::openldap

      if $::osfamily != 'OpenBSD' {
        include ::openldap::client
      }

      class { '::openldap::server':
        root_dn       => 'cn=Manager,dc=example,dc=com',
        root_password => 'secret',
        suffix        => 'dc=example,dc=com',
        access        => [
          [
            {
              'attrs' => ['userPassword'],
            },
            [
              {
                'who'    => ['self'],
                'access' => '=xw',
              },
              {
                'who'    => ['anonymous'],
                'access' => 'auth',
              },
            ],
          ],
          [
            {
              'dn' => '*',
            },
            [
              {
                'who'    => ['dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"'],
                'access' => 'manage',
              },
              {
                'who'    => ['users'],
                'access' => 'read',
              },
            ],
          ],
        ],
      }

      ::openldap::server::schema { 'cosine':
        ensure => present,
      }
      ::openldap::server::schema { 'inetorgperson':
        ensure  => present,
        require => ::Openldap::Server::Schema['cosine'],
      }
      ::openldap::server::schema { 'nis':
        ensure  => present,
        require => ::Openldap::Server::Schema['inetorgperson'],
      }

      case $::osfamily {
        'RedHat': {
          case $::operatingsystemmajrelease {
            '6': {
              $run_as = 'nobody'
              $user   = undef
            }
            default: {
              $run_as = undef
              $user   = 'nobody'
            }
          }
        }
        default: {
          $run_as = undef
          $user   = 'nobody'
        }
      }

      # Beaker sets these during setup so we should persist them
      class { '::openssh::server':
        authorized_keys_command        => '#{ldap}',
        authorized_keys_command_run_as => $run_as,
        authorized_keys_command_user   => $user,
        permit_root_login              => true,
        permit_user_environment        => true,
      }

      class { '::openssh::server::ldap':
        base_dn => 'ou=people,dc=example,dc=com',
        bind_dn => 'cn=Manager,dc=example,dc=com',
        bind_pw => 'secret',
        ssl     => false,
        uri     => [
          'ldap://127.0.0.1',
        ],
      }

      ::openldap::server::schema { 'openssh-lpk':
        ensure  => present,
        ldif    => '/root/openssh-lpk.ldif',
        require => [
          ::Openldap::Server::Schema['nis'],
          Class['::Openssh::Server::Ldap'],
        ],
      }
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe command('ldapadd -Y EXTERNAL -H ldapi:/// -f /root/example.ldif') do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe package(package) do
    it { is_expected.to be_installed }
  end

  describe file('/etc/ssh/sshd_config') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 600 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
    its(:content) { is_expected.to match /^ AuthorizedKeysCommand \s+ #{ldap} $/x }
    its(:content) { is_expected.to match /^ AuthorizedKeysCommand (?: User | RunAs ) \s+ nobody $/x }
  end

  describe file('/etc/ssh/ldap.conf') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
  end

  describe command("#{ldap} alice") do
    its(:stdout) { is_expected.to match /^ ssh-rsa \s AAAA/x }
    its(:exit_status) { is_expected.to eq 0 }
  end
end
