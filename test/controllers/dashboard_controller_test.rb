require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    sign_in_as(users(:devin))
    get dashboard_url
    assert_response :success
  end

  test "should redirect to login page if not signed in" do
    get dashboard_url
    assert_redirected_to sign_in_path
  end

end
