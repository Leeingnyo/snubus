require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  test "should get show_routes" do
    get :show_routes
    assert_response :success
  end

end
