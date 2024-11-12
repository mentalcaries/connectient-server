class DashboardController < ApplicationController
  # skip_before_action :authenticate
  layout 'dashboard'

  def index
    @appointments = Appointment.all
    render inertia: "Dashboard", props: {
      appointments: @appointments, logged_in: user_logged_in?
    }
  end
end
