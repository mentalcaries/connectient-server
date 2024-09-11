require "test_helper"

class PracticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice = practices(:one)
  end

  test "should get index" do
    get practices_url, as: :json
    assert_response :success
  end

  test "should create practice" do
    assert_difference("Practice.count") do
      post practices_url, params: { practice: { city: @practice.city, email: @practice.email, facebook: @practice.facebook, instagram: @practice.instagram, logo: @practice.logo, mobile_phone: @practice.mobile_phone, name: @practice.name, practice_code: @practice.practice_code, street_address: @practice.street_address, website: @practice.website } }, as: :json
    end

    assert_response :created
  end

  test "should show practice" do
    get practice_url(@practice), as: :json
    assert_response :success
  end

  test "should update practice" do
    patch practice_url(@practice), params: { practice: { city: @practice.city, email: @practice.email, facebook: @practice.facebook, instagram: @practice.instagram, logo: @practice.logo, mobile_phone: @practice.mobile_phone, name: @practice.name, practice_code: @practice.practice_code, street_address: @practice.street_address, website: @practice.website } }, as: :json
    assert_response :success
  end

  test "should destroy practice" do
    assert_difference("Practice.count", -1) do
      delete practice_url(@practice), as: :json
    end

    assert_response :no_content
  end
end
