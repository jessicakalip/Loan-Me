class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show destroy edit update]
  def index
    @profiles = policy_scope(Profile)
  end

  def show
    @profile = Profile.find(params[:id])
    @hangout = Hangout.new
    @hangout.profile = @profile
  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    authorize @profile
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
    authorize @profile
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    authorize @profile
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :interest, :age, :gender, :photo)
  end

  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end
end
