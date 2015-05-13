require 'test_helper'

class StopsControllerTest < ActionController::TestCase
  test "Show stop page" do
    stops = ["기숙사삼거리", "신소재", "제2공학관", "서울대정문", "농생대"]
    stops.each do |stop_name|
      stop = Stop.find_by(:name => stop_name)
      get(:show, :id => stop.stop_id)
      assert_response(:success)
    end
  end
end
