require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get find" do
    get :find
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
