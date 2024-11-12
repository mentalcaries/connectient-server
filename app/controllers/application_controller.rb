class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  include ApplicationHelper

  before_action :set_current_request_details
  before_action :authenticate

  private
  def authenticate
    if session_record = Session.find_by_id(cookies.signed[:session_token])
      Current.session = session_record
      puts "SESSION: #{Current.session.attributes}"
    else
      redirect_to login_path
    end
  end

    def set_current_request_details
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end

    def record_not_found(exception)
      render json: { error: exception.message }, status: :not_found
    end
end
