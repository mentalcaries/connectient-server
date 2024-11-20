require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should sign up" do
    assert_difference("User.count") do
      post sign_up_url, params: { email: "devin2@connectient.co", password: "Secret1*3*5*", password_confirmation: "Secret1*3*5*" }
    end
    assert_redirected_to sign_in_path
  end
end
