class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show destroy edit update]
  def index
    @profiles = Profile.all

     @markers = @profiles.geocoded.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude
      }
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @hangout = Hangout.new
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

  def edit
  end

  def update
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :interest, :age, :gender, :photo)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
