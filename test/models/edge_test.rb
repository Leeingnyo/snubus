require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  test '#get_duration' do
    t = Edge.get_duration('4551100', '33712', '3447')
    assert_equal(1080, t)
  end
end
