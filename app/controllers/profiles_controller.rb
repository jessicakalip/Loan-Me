class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show destroy edit update]
  def index
    if params[:gender].present?
      min_age = params[:min_age].to_i
      max_age = params[:max_age].to_i
      age_range = (min_age..max_age)
      @profiles = Profile.where(address: params[:query])
      @profiles = @profiles.where(gender: params[:gender])
      @profiles = @profiles.where("profiles.age BETWEEN min_age and max_age")
      @profiles = @profiles.where(interest: params[:interests])
    else
      @profiles = Profile.all
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
