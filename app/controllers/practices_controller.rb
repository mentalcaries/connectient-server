class PracticesController < ApplicationController
  before_action :set_practice, only: %i[ show update destroy ]
  # skip_before_action :authenticate, only: :
  # GET /practices
  def index
    @practices = Practice.all
    render json: @practices
  end

  # GET /practices/1
  def show
    render json: @practice
  end

  # POST /practices
  def create
    @practice = Practice.new(practice_params)

    if @practice.save
      render json: @practice, status: :created, location: @practice
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /practices/1
  def update
    if @practice.update(practice_params)
      render json: @practice
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /practices/1
  def destroy
    @practice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def practice_params
      params.require(:practice).permit(:name, :street_address, :city, :email, :phone, :practice_code, :logo, :facebook, :instagram, :website)
    end
end
