require 'spec_helper_acceptance'

describe 'openssh::server::sftp' do
  case fact('osfamily')
  when 'RedHat'
    group = 'root'
    sftp  = '/usr/libexec/openssh/sftp-server'
  when 'OpenBSD'
    group = 'wheel'
    sftp  = '/usr/libexec/sftp-server'
  end

  it 'should work with no errors' do

    pp = <<-EOS
      # Beaker sets these during setup so we should persist them
      class { '::openssh::server':
        permit_root_login       => true,
        permit_user_environment => true,
      }

      include ::openssh::server::sftp
    EOS

    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes  => true)
  end

  describe file('/etc/ssh/sshd_config') do
    it { is_expected.to be_file }
    it { is_expected.to be_mode 600 }
    it { is_expected.to be_owned_by 'root' }
    it { is_expected.to be_grouped_into group }
    its(:content) { is_expected.to match /^ Subsystem \s+ sftp \s+ #{sftp} $/x }
  end
end
