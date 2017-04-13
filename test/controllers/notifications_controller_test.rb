require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  test "should get viewNotifications" do
    get :viewNotifications
    assert_response :success
  end

end
