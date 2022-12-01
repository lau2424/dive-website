class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spots = Spot.all

    # The `geocoded` scope filters only flats with coordinates
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot, average_rating: average_rating(spot) }),
        image_url: helpers.asset_url("markerdive.png")
      }
    end

  end

  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @user = current_user
    @spot.user = @user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to root_path
  end

  def average_rating(spot)
    @average = spot.reviews.map do |review|
      review.rating
    end
    unless spot.reviews.empty?
      @average.sum / @average.size
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :longitude, :latitude, :facility, :category, :difficulty, :address, photos: [])
  end
end
