require 'spec_helper'

describe 'openssh::server' do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('openssh::server') }
      it { is_expected.to contain_class('openssh::server::config') }
      it { is_expected.to contain_class('openssh::server::install') }
      it { is_expected.to contain_class('openssh::server::service') }
      it { is_expected.to contain_concat('/etc/ssh/sshd_config') }
      it { is_expected.to contain_file('/etc/ssh') }
      it { is_expected.to contain_service('sshd') }

      case facts[:osfamily]
      when 'RedHat'
        it { is_expected.to contain_package('openssh-server') }

        case facts[:operatingsystemmajrelease]
        when '6'
          it { is_expected.to contain_concat__fragment('openssh server config').with_content(<<-EOS.gsub(/^ {12}/, '')) }

            AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS
            ChallengeResponseAuthentication no
            GSSAPIAuthentication yes
            GSSAPICleanupCredentials yes
            PasswordAuthentication yes
            Protocol 2
            SyslogFacility AUTHPRIV
            UsePAM yes
            X11Forwarding yes
            EOS
        else
          it { is_expected.to contain_concat__fragment('openssh server config').with_content(<<-EOS.gsub(/^ {12}/, '')) }

            AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT LC_IDENTIFICATION LC_ALL LANGUAGE XMODIFIERS
            AuthorizedKeysFile .ssh/authorized_keys
            ChallengeResponseAuthentication no
            GSSAPIAuthentication yes
            GSSAPICleanupCredentials no
            HostKey /etc/ssh/ssh_host_rsa_key
            HostKey /etc/ssh/ssh_host_ecdsa_key
            HostKey /etc/ssh/ssh_host_ed25519_key
            PasswordAuthentication yes
            SyslogFacility AUTHPRIV
            UsePAM yes
            UsePrivilegeSeparation sandbox
            X11Forwarding yes
            EOS
        end
      when 'OpenBSD'
        it { is_expected.to contain_concat__fragment('openssh server config').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          AuthorizedKeysFile .ssh/authorized_keys
          EOS
        it { is_expected.to have_package_resource_count(0) }
      end
    end
  end
end
