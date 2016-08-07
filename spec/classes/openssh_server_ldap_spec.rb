require 'spec_helper'

describe 'openssh::server::ldap' do

  let(:params) do
    {
      :base_dn => 'ou=people,dc=example,dc=com',
      :uri     => [
        'ldap://example.com',
      ],
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without openssh::server class included' do
        it { is_expected.to compile.and_raise_error(/must include the openssh::server class/) }
      end

      context 'with openssh::server class included' do
        let(:pre_condition) do
          'include ::openssh::server'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('openssh::server::ldap') }
        it { is_expected.to contain_class('openssh::server::ldap::config') }
        it { is_expected.to contain_class('openssh::server::ldap::install') }
        it { is_expected.to contain_file('/etc/ssh/ldap.conf') }
        #it { is_expected.to contain_sshd_config('AuthorizedKeysCommand') }
        #it { is_expected.to contain_sshd_config('AuthorizedKeysCommandUser') }

        case facts[:osfamily]
        when 'RedHat'
          it { is_expected.to contain_package('openssh-ldap') }
        when 'OpenBSD'
          it { is_expected.to contain_package('ssh-ldap-helper') }
        end
      end
    end
  end
end
