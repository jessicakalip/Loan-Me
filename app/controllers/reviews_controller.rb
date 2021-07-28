class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    raise
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
