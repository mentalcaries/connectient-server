module ApplicationHelper
  def user_logged_in?
    Current.session.present?
  end

end