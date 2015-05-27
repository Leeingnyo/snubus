require 'test_helper'

class BusesControllerTest < ActionController::TestCase
  test '#acquire_buses' do
    post :all_buses
    assert_not_nil response.body
  end

  test "#index" do
    get :index
    assert_response :success
  end
end
