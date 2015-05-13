require 'test_helper'

class StopTest < ActiveSupport::TestCase
  test "Check stops validity" do
    tests = [{:id => "33712", :name => "제2공학관"},
             {:id => "33707", :name => "경영대"},
             {:id => "33353", :name => "법대입구"},
             {:id => "33351", :name => "공대입구"},
             {:id => "34733", :name => "에너지자원연구소"},
             {:id => "33354", :name => "신소재"}]

    tests.each do |test|
      stop = Stop.find_by(:stop_id => test[:id])
      assert(stop, test[:name])
      assert_equal(stop.name, test[:name], test[:name])
    end
  end
end
