class DashboardController < ApplicationController
  # skip_before_action :authenticate
  layout 'dashboard'

  def index
    @appointments = Appointment.all
    render inertia: "Dashboard", props: {
      appointments: @appointments, 
    }
  end
end
