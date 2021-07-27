class HangoutsController < ApplicationController

  before_action :find_profile, only: [:create, :new]

  def index
    @hangouts = Hangout.all
  end


  def show
    @id = params[:id]
    @hangout = Hangout.find(@id)
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
      redirect_to profile_path(@profile)
      flash[:notice] = 'Your booking has benn saved!'
    else
      render 'profiles/show'
    end
  end

  private

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def hangout_params
    params.require(:hangout).permit(:date, :time)
  end

end
