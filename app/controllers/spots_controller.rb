class SpotsController < ApplicationController

  def index
    @spots = Spot.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url("scuba-diving-icon.svg")
      }
    end
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
