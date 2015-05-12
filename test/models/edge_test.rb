require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  test '#get_duration' do
    seed
    t = Edge.get_duration('4551100', '33712', '3447')
    assert_equal(1080, t)
    t = Edge.get_duration('4551100', '33712', '33712')
    assert_equal(0, t)
    t = Edge.get_duration('4551100', '3447', '33712')
    assert_equal(-1, t)
  end

  test '#get_stop_list' do
    seed
    t = Edge.get_stop_list('4551100', '33712', '3447')
    assert_equal(["33712", "33749", "3447"], t)
    t = Edge.get_stop_list('4551100', '33712', '33712')
    assert_equal(["33712"], t)
    t = Edge.get_stop_list('4551100', '3447', '33712')
    assert_equal(nil, t)
  end
end
