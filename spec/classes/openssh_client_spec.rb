require 'spec_helper'

describe 'openssh::client' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('openssh::client') }
      it { is_expected.to contain_class('openssh::client::config') }
      it { is_expected.to contain_class('openssh::client::install') }
      it { is_expected.to contain_concat('/etc/ssh/ssh_config') }
      it { is_expected.not_to contain_concat__fragment('openssh client /etc/ssh/ssh_config config') }
      it { is_expected.to contain_file('/etc/ssh') }
      it { is_expected.to contain_openssh__client__configuration('/etc/ssh/ssh_config') }

      case facts[:osfamily]
      when 'RedHat'
        it { is_expected.to contain_concat__fragment('openssh client /etc/ssh/ssh_config host *').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          Host *
          	ForwardX11Trusted yes
          	GSSAPIAuthentication yes
          	SendEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS
        EOS
        it { is_expected.to contain_openssh__client__host('defaults') }
        it { is_expected.to contain_package('openssh-clients') }
      when 'OpenBSD'
        it { is_expected.not_to contain_concat__fragment('openssh client /etc/ssh/ssh_config host *') }
        it { is_expected.to have_package_resource_count(0) }
      end
    end
  end
end
