class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @hangout = Hangout.find(params[:hangout_id])
    @review.hangout = @hangout
    @review.user = current_user
    if @review.save
      redirect_to hangout_path(@hangout)
    else
      render "hangouts/show"
    end
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
