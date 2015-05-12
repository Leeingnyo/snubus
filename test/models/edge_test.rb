require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  test '#get_duration' do
    t = Edge.get_duration('4551100', '33712', '3447')
    assert_equal(1080, t)
  end

  test '#get_duration when same stop' do
    t = Edge.get_duration('4551100', '33712', '33712')
    assert_equal(0, t)
  end

  test '#get_duration when no route' do
    t = Edge.get_duration('4551100', '3447', '33712')
    assert_equal(-1, t)
  end

  test '#get_stop_list' do
    t = Edge.get_stop_list('4551100', '33712', '3447')
    assert_equal(["33712", "33749", "3447"], t)
  end

  test '#get_stop_list when same stop' do
    t = Edge.get_stop_list('4551100', '33712', '33712')
    assert_equal(["33712"], t)
  end

  test '#get_stop_list when no route' do
    t = Edge.get_stop_list('4551100', '3447', '33712')
    assert_equal(nil, t)
  end
end
