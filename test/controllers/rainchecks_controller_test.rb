require 'test_helper'

class RainchecksControllerTest < ActionController::TestCase
  setup do
    @raincheck = rainchecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rainchecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raincheck" do
    assert_difference('Raincheck.count') do
      post :create, raincheck: {  }
    end

    assert_redirected_to raincheck_path(assigns(:raincheck))
  end

  test "should show raincheck" do
    get :show, id: @raincheck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raincheck
    assert_response :success
  end

  test "should update raincheck" do
    patch :update, id: @raincheck, raincheck: {  }
    assert_redirected_to raincheck_path(assigns(:raincheck))
  end

  test "should destroy raincheck" do
    assert_difference('Raincheck.count', -1) do
      delete :destroy, id: @raincheck
    end

    assert_redirected_to rainchecks_path
  end
end
