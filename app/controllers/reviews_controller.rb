class ReviewsController < ApplicationController
  before_action :find_review, only: %(destroy create)

  def create
    @review = Review.new(review_params)
    @review.hangout_id = params[:hangout_id]
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to hangout_path(@review.hangout)
    else
      render "hangouts/show"
    end
  end

  def destroy
    @hangout.delete
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_review
    @hangout = Hangout.find(params[:hangout_id])
  end
end
