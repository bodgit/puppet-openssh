require 'spec_helper'

describe 'openssh::server::subsystem' do
  let(:title) do
    'sftp'
  end

  let(:params) do
    {
      command: '/usr/libexec/openssh/sftp-server',
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
        it { is_expected.to contain_concat__fragment('openssh server subsystem sftp').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          Subsystem sftp /usr/libexec/openssh/sftp-server
          EOS
      end
    end
  end
end
