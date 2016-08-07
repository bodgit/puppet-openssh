require 'spec_helper'

describe 'OpenSSH::QoS' do
  it { is_expected.to allow_values('af11', 'af12', 'af13', 'af21', 'af22', 'af23', 'af31', 'af32', 'af33', 'af41', 'af42', 'af43', 'cs0', 'cs1', 'cs2', 'cs3', 'cs4', 'cs5', 'cs6', 'cs7', 'ef', 'lowdelay', 'throughput', 'reliability', 0, 1) }
  it { is_expected.not_to allow_value('invalid', -1) }
end
