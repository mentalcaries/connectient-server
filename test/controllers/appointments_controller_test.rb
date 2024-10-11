require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice = practices(:practice_one)
    @appointment = appointments(:one)
    @appointment_other = appointments(:six)
    @user, @token = sign_in_as(users(:devin))

  end

  test "should get appointments only for specific practice" do
    get appointments_url, headers: default_headers, as: :json
    assert_response :success

    appointments = JSON.parse(response.body)
    assert_equal 4, appointments.count
  end

  test "should create appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: { appointment: { practice_id: @appointment.practice_id, description: @appointment.description, email: @appointment.email, first_name: @appointment.first_name, is_emergency: @appointment.is_emergency, last_name: @appointment.last_name, mobile_phone: @appointment.mobile_phone, requested_date: @appointment.requested_date, requested_time: @appointment.requested_time, scheduled_date: @appointment.scheduled_date, scheduled_time: @appointment.scheduled_time } }, as: :json
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

  test "should not be able to update appointment from other practice" do
    patch appointment_url(@appointment_other), headers: default_headers, params: { appointment: { description: @appointment.description, email: @appointment.email, first_name: @appointment.first_name, is_emergency: @appointment.is_emergency, last_name: @appointment.last_name, mobile_phone: @appointment.mobile_phone, requested_date: @appointment.requested_date, requested_time: @appointment.requested_time, scheduled_date: @appointment.scheduled_date, scheduled_time: @appointment.scheduled_time } }, as: :json
    assert_response :unauthorized
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment), headers: default_headers ,as: :json
    end

    assert_response :no_content
  end
end
