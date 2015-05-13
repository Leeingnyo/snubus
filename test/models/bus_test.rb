require 'test_helper'

class BusTest < ActiveSupport::TestCase
  test '#coming_buses' do
    add_buses
    e = Edge.find(17)
    res = Bus.coming_buses(e)
    
    assert res
    assert_equal(res.fetch(0)["time"], 60)
    assert_equal(res.fetch(1)["time"], 60)
  end

  test '#update' do
    bus_before = Bus.first
    assert_not bus_before
    Rails.configuration.x.should_not_update_buses = false
    Bus.validate
    bus_after = Bus.first
    Rails.configuration.x.should_not_update_buses = true
    assert bus_after
  end
end
