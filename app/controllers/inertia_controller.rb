class InertiaController < ApplicationController
  skip_before_action :authenticate
  def index
    # render inertia: "InertiaExample", props: {
    #   name: params.fetch(:name, "World")
    # }
  end
end
