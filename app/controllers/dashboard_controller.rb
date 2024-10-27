class DashboardController < ApplicationController
  skip_before_action :authenticate, only: :index
  def index
    render layout: 'application'
  end
end
