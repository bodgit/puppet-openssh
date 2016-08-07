require 'spec_helper_acceptance'

describe 'openssh::server' do
  case fact('osfamily')
  when 'RedHat'
    group = 'root'
  when 'OpenBSD'
    group = 'wheel'
  end

  it 'should work with no errors' do

    pp = <<-EOS
      # Beaker sets these during setup so we should persist them
      class { '::openssh::server':
        permit_root_login       => true,
        permit_user_environment => true,
      }

      ::openssh::server::match { 'sftponly':
        group                => ['sftponly'],
        chroot_directory     => '%h',
        force_command        => 'internal-sftp',
        allow_tcp_forwarding => false,
        x11_forwarding       => false,
      }
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('openssh-server'), :unless => fact('osfamily').eql?('OpenBSD') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/ssh/sshd_config') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 600 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
    its(:content) { is_expected.to match %r{^ Match \s Group \s sftponly $}mx }
  end

  describe service('sshd') do
    it { is_expected.to be_enabled }
    it { is_expected.to be_running }
  end
end
