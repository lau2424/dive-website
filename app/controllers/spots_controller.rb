class SpotsController < ApplicationController

  def index
      @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    # @review = Reviewtable.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spots_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spot = Spot.find(paramas[:id])
  end

  def destroy
    @spot = Spot.find(paramas[:id])
    @spot.destroy
  end

  def my_method

  end

  private

  def spot_params
    params.require(:butler).permit(:name, :description, :longitude, :latitude, :facility, :equipment, :difficulty)
  end
end
