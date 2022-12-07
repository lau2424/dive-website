class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spots = policy_scope(Spot)

    if params[:filter] == "snorkeling"
      build_markers("Snorkeling")
    elsif params[:filter] == "scubadiving"
      build_markers("Scuba Diving")
    elsif params[:filter] == "snorkeling_scubadiving"
      build_markers("Scuba Diving & Snorkeling")
    else
      @markers = @spots.geocoded.map do |spot|
        {
          lat: spot.latitude,
          lng: spot.longitude,
          info_window: render_to_string(partial: "info_window", locals: { spot: spot, average_rating: average_rating(spot) }),
          image_url: helpers.asset_url(addapting_icon(spot))
        }
      end
    end
  end

  def build_markers(category)
    @markers = @spots.where(category: category).geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot, average_rating: average_rating(spot) }),
        image_url: helpers.asset_url(addapting_icon(spot))
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @review = Review.new
    authorize @spot
    @reviews = policy_scope(Review)
  end

  def new
    @spot = Spot.new
    authorize @spot
  end

  def create
    @spot = Spot.new(spot_params)
    @user = current_user
    @spot.user = @user
    authorize @spot
    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @spot = Spot.find(params[:id])
    authorize @spot
  end

  def update
    @spot = Spot.find(params[:id])
    lat = @spot.latitude
    long = @spot.longitude
    authorize @spot
    if @spot.update(spot_params)
      @spot.update(longitude: long, latitude: lat)
      redirect_to spot_path(@spot)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    authorize @spot
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

  def addapting_icon(spot)
    if spot.category == "Snorkeling"
      "Snorkeling.png"
    elsif spot.category == "Scuba Diving"
      "markerdive.png"
    elsif spot.category == "Scuba Diving & Snorkeling"
      "Scubadiving&Snorkeling.png"
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :description, :longitude, :latitude, :category, :difficulty, :address, photos: [], facility: [] )
  end
end
