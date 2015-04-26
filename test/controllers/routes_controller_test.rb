require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  test "#should_get_show_routes" do
    get :show_routes, {:departure => 33712, :destination => 3447}
    assert_response :success
  end
end
