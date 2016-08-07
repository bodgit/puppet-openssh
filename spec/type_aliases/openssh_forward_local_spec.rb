require 'spec_helper'

describe 'OpenSSH::Forward::Local' do
  it { is_expected.to allow_value([80, ['host.example.com', 80]]) }
  it { is_expected.to allow_value([['2001:db8::1', 80], ['host.example.com', 80]]) }
  it { is_expected.to allow_value([['*', 80], ['host.example.com', 80]]) }
  it { is_expected.to allow_value([['localhost', 80], ['host.example.com', 80]]) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
