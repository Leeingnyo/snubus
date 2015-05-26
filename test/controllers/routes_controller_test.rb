require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  test "#should_get_show_routes" do
    get :show_routes, {:departure => 33712, :destination => 3447}
    assert_response :success

    get :show_routes, {:departure => 33712, :destination => 34400}
    assert_redirected_to :root
  end

  test "#last_routes" do
    get :last_routes
    assert_response :success
  end

  test "#show_routes_with_subway" do
    get :show_routes, {:departure => 33712, :destination => 3719}
    assert_match /지하철/, response.body
  end

  test "#show_routes_to_sadang" do
    get :show_routes, {:departure => 33712, :destination => 10}
    assert_match /사당방면/, response.body
    assert_match /서울대입구역/, response.body
    assert_match /낙성대입구/, response.body
  end
end
