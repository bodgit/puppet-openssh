require 'spec_helper'

describe 'openssh::server::match' do
  let(:title) do
    'test'
  end

  let(:params) do
    {
      accept_env:  ['foo', 'bar'],
      user:        ['test'],
      group:       ['test'],
      permit_open: [['2001:db::1', '*'], ['192.0.2.1', 22]],
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'without openssh::server class included' do
        it { is_expected.to compile.and_raise_error(%r{must include the openssh::server base class}) }
      end

      context 'with openssh::server class included' do
        let(:pre_condition) do
          'include ::openssh::server'
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_concat__fragment('openssh server match test').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          Match User test Group test
          	AcceptEnv foo bar
          	PermitOpen [2001:db::1]:* 192.0.2.1:22
          EOS
      end
    end
  end
end
