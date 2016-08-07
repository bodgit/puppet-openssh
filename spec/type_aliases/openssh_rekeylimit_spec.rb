require 'spec_helper'

describe 'OpenSSH::RekeyLimit' do
  it { is_expected.to allow_values(['default'], ['1K'], ['default', 'none'], ['default', '1s'], ['1K', '1s']) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
