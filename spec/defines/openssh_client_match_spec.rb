require 'spec_helper'

describe 'openssh::client::match' do
  let(:title) do
    'test'
  end

  let(:params) do
    {
      canonical:        true,
      canonical_negate: true,
      users:            ['alice'],
      target:           '/etc/ssh/ssh_config',
      proxy_jump:       ['gateway.example.com'],
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without openssh::client class included' do
        it { is_expected.to compile.and_raise_error(%r{must include the openssh::client base class}) }
      end

      context 'with openssh::client class included' do
        let(:pre_condition) do
          'include ::openssh::client'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat__fragment('openssh client /etc/ssh/ssh_config match test').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          Match !canonical user alice
          	ProxyJump gateway.example.com
          EOS
      end
    end
  end
end
