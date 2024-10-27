class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_current_request_details
  before_action :authenticate

  private
    def authenticate
      if session_record = authenticate_with_http_token { |token, _| Session.find_signed(token) }
        Current.session = session_record
      else
        # request_http_token_authentication
        render json: {error: "Unauthorized", status: :unauthorized}
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
