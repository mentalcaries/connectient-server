class InertiaExampleController < ApplicationController
  skip_before_action :authenticate
  layout 'dashboard'
  def index
    render inertia: "InertiaExample", props: {
      name: params.fetch(:name, "World")
    }
  end
end
