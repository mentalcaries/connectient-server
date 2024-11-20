class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[create new]

  layout 'dashboard'

  # before_action :set_session, only: %i[ destroy ]

  def index
    @sessions =  Current.user.sessions.order(created_at: :desc)
  end

  def new
    render inertia: "Login"
    
  end
  # def show
  #   render json: @session
  # end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      @session = user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: @session.id, httponly: true }
      redirect_to dashboard_path
    else
      # render inertia: "Login", props: { errors: { message: "Invalid credentials"}}
      redirect_to sign_in_path, inertia: { errors: { message: "Invalid credentials. Please try again."} }

    end
  end

  def destroy
    Current.session.destroy
    redirect_to sign_in_path, inertia: { success: { message: "You have been logged out."} }

    # render inertia: "Auth/Login", props: { message: { success: "You have been logged out"} }
  # inertia_location sign_in_path
  end

  private
    def set_session
      @session = Current.user.sessions.find(params[:id])
    end
end
