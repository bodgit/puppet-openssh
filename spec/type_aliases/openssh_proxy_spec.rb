require 'spec_helper'

describe 'OpenSSH::Proxy' do
  it { is_expected.to allow_value('gateway.example.com') }
  it { is_expected.to allow_value(['gateway.example.com', 22]) }
  it { is_expected.to allow_value(['user', 'gateway.example.com']) }
  it { is_expected.to allow_value(['user', 'gateway.example.com', 22]) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
