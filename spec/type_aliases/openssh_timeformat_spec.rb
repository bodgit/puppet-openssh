require 'spec_helper'

describe 'OpenSSH::TimeFormat' do
  it { is_expected.to allow_values('3600', '1H5m1s') }
  it { is_expected.not_to allow_value('invalid', -1) }
end
