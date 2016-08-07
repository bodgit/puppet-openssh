require 'spec_helper'

describe 'OpenSSH::Forward::Dynamic' do
  it { is_expected.to allow_value(80) }
  it { is_expected.to allow_value(['2001:db8::1', 80]) }
  it { is_expected.to allow_value(['*', 80]) }
  it { is_expected.to allow_value(['localhost', 80]) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
