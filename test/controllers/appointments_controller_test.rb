require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @user, @token = sign_in_as(users(:devin))
  end

  def default_headers
    { "Authorization" => "Bearer #{@token}"}
  end

  test "should get index" do
    get appointments_url, headers: default_headers, as: :json
    assert_response :success
  end

  test "should create appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: { appointment: { description: @appointment.description, email: @appointment.email, first_name: @appointment.first_name, is_emergency: @appointment.is_emergency, last_name: @appointment.last_name, mobile_phone: @appointment.mobile_phone, requested_date: @appointment.requested_date, requested_time: @appointment.requested_time, scheduled_date: @appointment.scheduled_date, scheduled_time: @appointment.scheduled_time } }, as: :json
    end

    assert_response :created
  end

  test "should show appointment" do
    get appointment_url(@appointment), headers: default_headers, as: :json
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), headers: default_headers, params: { appointment: { description: @appointment.description, email: @appointment.email, first_name: @appointment.first_name, is_emergency: @appointment.is_emergency, last_name: @appointment.last_name, mobile_phone: @appointment.mobile_phone, requested_date: @appointment.requested_date, requested_time: @appointment.requested_time, scheduled_date: @appointment.scheduled_date, scheduled_time: @appointment.scheduled_time } }, as: :json
    assert_response :success
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment), headers: default_headers ,as: :json
    end

    assert_response :no_content
  end
end
