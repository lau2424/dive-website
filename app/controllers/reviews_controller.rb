class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def new
    @spot = Spot.find(params[:spot_id])
    @review = Review.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @user = current_user
    @review = Review.new(review_params)
    authorize @review
    @review.user = @user
    @review.spot = @spot
    if @review.save
      redirect_to spot_path(@spot)
    else
      render "spots/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to spot_path(@review.spot), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :photo)
  end
end
