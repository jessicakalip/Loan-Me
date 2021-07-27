class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :interest, :age, :gender, :photo)
  end
end
