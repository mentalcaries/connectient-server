class PagesController < ApplicationController
  skip_before_action :authenticate

  layout 'home'

  def index
  end
end
