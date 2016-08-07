require 'spec_helper'

describe 'openssh::client::configuration' do
  let(:title) do
    '/home/alice/.ssh/config'
  end

  let(:params) do
    {
      owner:                       'alice',
      group:                       'alice',
      mode:                        '0640',
      canonicalize_hostname:       true,
      canonical_domains:           ['example.com'],
      canonicalize_max_dots:       0,
      canonicalize_fallback_local: false,
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
        it { is_expected.to contain_concat('/home/alice/.ssh/config') }
        it { is_expected.to contain_concat__fragment('openssh client /home/alice/.ssh/config config').with_content(<<-EOS.gsub(/^ {10}/, '')) }

          CanonicalDomains example.com
          CanonicalizeFallbackLocal no
          CanonicalizeHostname yes
          CanonicalizeMaxDots 0
          EOS
      end
    end
  end
end
