class HangoutsController < ApplicationController
  before_action :set_hangout, only: [:show, :edit, :update]
  before_action :find_profile, only: [:create, :new]

  def index
    @hangouts = Hangout.all
  end

  def show
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

  def edit
    @hangout = Hangout.find(params[:id])
  end

  def update
    @hangout.update(hangout_params)
    redirect_to hangout_path(@hangout)
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
    params.require(:hangout).permit(:date, :time)
  end
end
