require 'spec_helper_acceptance'

describe 'openssh::client' do
  case fact('osfamily')
  when 'RedHat'
    group = 'root'
  when 'OpenBSD'
    group = 'wheel'
  end

  it 'should work with no errors' do

    pp = <<-EOS
      include ::openssh::client

      file { '/root/.ssh':
        ensure => directory,
        owner  => 0,
        group  => 0,
        mode   => '0640',
      }

      ::openssh::client::configuration { '/root/.ssh/config':
        owner => 0,
        group => 0,
        mode  => '0640',
      }

      ::openssh::client::match { 'catch-all':
        target        => '/root/.ssh/config',
        proxy_command => '/usr/bin/nc -X connect -x 192.0.2.0:8080 %h %p',
      }

      ::openssh::client::host { 'defaults':
        host          => '*',
        target        => '/root/.ssh/config',
        order         => 99,
        proxy_command => '/usr/bin/nc -X connect -x 192.0.2.0:8080 %h %p',
      }
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe package('openssh-clients'), :unless => fact('osfamily').eql?('OpenBSD') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/ssh/ssh_config') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 644 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
  end

  describe file('/root/.ssh/config') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 640 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
    its(:content) { is_expected.to match %r{^ Host \s \* $}mx }
    its(:content) { is_expected.to match %r{^ Match \s all $}mx }
  end
end
