require 'test_helper'

class BusTest < ActiveSupport::TestCase
  test '#coming_buses' do
    e = Edge.find(2)
    res = Bus.coming_buses(e)

    if res.empty?
      return
    end

    assert_equal(res.fetch(0)["time"], 180)
    assert_equal(res.fetch(1)["time"], 60)
  end
end
