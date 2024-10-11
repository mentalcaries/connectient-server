class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show update destroy ]
  before_action :set_current_user, only: [:index, :update]
  before_action :set_current_practice, only: [:index, :update]
  before_action :is_authorized_user, only: :update
  skip_before_action :authenticate, only: :create

  # GET /appointments
  def index
    # current_practice = Practice.find_by(user_id: @current_user.id)
    if @current_practice
      @appointments = Appointment.where(practice_id: @current_practice.id)
    else
        @appointments = []
    end
    render json: @appointments
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_current_user
      @current_user = Current.user
    end

    def set_current_practice
      @current_practice = Practice.find_by(user_id: @current_user.id)
    end
    
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
    
    def is_authorized_user
      is_authorized = @appointment.practice_id == @current_practice.id
      render status: :unauthorized if !is_authorized
    end


    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:practice_id, :first_name, :last_name, :mobile_phone, :email, :requested_date, :requested_time, :scheduled_date, :scheduled_time, :is_emergency, :description)
    end
end
