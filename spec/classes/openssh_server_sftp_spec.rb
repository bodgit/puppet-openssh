require 'spec_helper'

describe 'openssh::server::sftp' do

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
        it { is_expected.to contain_class('openssh::server::sftp') }
        it { is_expected.to contain_class('openssh::server::sftp::config') }
        it { is_expected.to contain_class('openssh::server::sftp::install') }
        it { is_expected.to contain_concat__fragment('openssh server subsystem sftp') }
        it { is_expected.to contain_openssh__server__subsystem('sftp') }
      end
    end
  end
end
