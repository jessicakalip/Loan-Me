class HangoutsController < ApplicationController
  before_action :set_hangout, only: %i[show edit update destroy]
  before_action :find_profile, only: %i[create new]

  def index
    @hangouts = Hangout.all
  end

  def show
    @review = Review.new if @hangout.review.nil?
  end

  def new
    @hangout = Hangout.new
  end

  def create
    @hangout = Hangout.new(hangout_params)
    # link the bookmark to the restaurant
    @hangout.profile = @profile
    @hangout.user = current_user
    if @hangout.save
      redirect_to hangout_path(@hangout)
      flash[:notice] = 'Your booking has benn saved!'
    else
      render 'profiles/show'
    end
  end

  def edit
    @hangout = Hangout.find(params[:id])
  end

  def update
    @hangout.update(hangout_params)
    redirect_to dashboard_path
  end

  def destroy
    @hangout.destroy
    redirect_to dashboard_path
  end

  private

  def set_hangout
    @id = params[:id]
    @hangout = Hangout.find(@id)
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def hangout_params
    params.require(:hangout).permit(:date, :time, :status)
  end
end
