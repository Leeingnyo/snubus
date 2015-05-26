require 'test_helper'

class StationTest < ActiveSupport::TestCase
  test "#subway-model-test" do
    station = Station.where(:name => "낙성대역", :kind => 0, :direction => "봉천").where("arrival_time > 500").order("arrival_time asc").first
    assert_equal 501, station.arrival_time
  end

  test "#test-station-model" do
    assert_equal 2747, Station.all.length
  end
end
