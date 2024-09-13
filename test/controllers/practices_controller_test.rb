require "test_helper"

class PracticesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @practice = practices(:practice_two)
  end

  test "should get index" do
    get practices_url, as: :json
    assert_response :success
  end

  test "should create practice" do
    test_practice = practices(:practice_one)
    assert_difference("Practice.count") do
      post practices_url, params: { practice: { city: test_practice.city, email: Faker::Internet.unique.email, facebook: test_practice.facebook, instagram: test_practice.instagram, logo: test_practice.logo, phone: test_practice.phone, name: test_practice.name, practice_code: test_practice.practice_code, street_address: test_practice.street_address, website: test_practice.website } }, as: :json
    end

    assert_response :created
  end

  test "should show practice" do
    get practice_url(@practice), as: :json
    assert_response :success
  end

  test "should update practice" do
    patch practice_url(@practice), params: { practice: { city: @practice.city, email: @practice.email, facebook: @practice.facebook, instagram: @practice.instagram, logo: @practice.logo, phone: @practice.phone, name: @practice.name, practice_code: @practice.practice_code, street_address: @practice.street_address, website: @practice.website } }, as: :json
    assert_response :success
  end

  test "should destroy practice" do
    assert_difference("Practice.count", -1) do
      delete practice_url(@practice), as: :json
    end

    assert_response :no_content
  end
end
