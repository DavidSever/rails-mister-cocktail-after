class ReviewsController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
  end

  private

  def reviews_params
    params.require(:review).permit(:content)
  end

end
