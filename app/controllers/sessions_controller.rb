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
      render inertia: "Login", props: { message: { error: "Invalid credentials"}}
    end
  end

  def destroy
    Current.session.destroy
    # render inertia: "Auth/Login", props: { message: { success: "You have been logged out"} }
  inertia_location login_path
  end

  private
    def set_session
      @session = Current.user.sessions.find(params[:id])
    end
end
