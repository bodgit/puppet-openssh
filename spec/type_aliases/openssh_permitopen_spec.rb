require 'spec_helper'

describe 'OpenSSH::PermitOpen' do
  it { is_expected.to allow_value(['*', '*']) }
  it { is_expected.to allow_value(['www.example.com', 80]) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
