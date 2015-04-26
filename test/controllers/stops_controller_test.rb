require 'test_helper'

class StopsControllerTest < ActionController::TestCase
  test "#stop_success" do
    get :show, {:id => "33749"}
    assert_match '5511', response.body
  end
end
