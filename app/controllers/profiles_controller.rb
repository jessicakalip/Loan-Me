class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show destroy edit update]
  def index
    @profiles = policy_scope(Profile)

    if params[:address] == "All"
      @profiles = policy_scope(Profile)
    elsif params[:address].present?
      @profiles = @profiles.near(params[:address])
    end

    @profiles = @profiles.where(gender: params[:gender]) if params[:gender].present?

    if params[:min_age].present? && params[:max_age].present?
      @profiles = @profiles.where("profiles.age BETWEEN #{params[:min_age]} and #{params[:max_age]}")
    elsif params[:min_age].present?
      @profiles = @profiles.where("profiles.age > #{params[:min_age]}")
    elsif params[:max_age].present?
      @profiles = @profiles.where("profiles.age < #{params[:max_age]}")
    end

    if params[:interests].present?
      profiles_filter = []
      @profiles.each do |profile|
        profile_interest = profile.interest.split(" ")
        params[:interests].each do |interest|
          profiles_filter << profile if profile_interest.include?(interest)
        end
      end
      @profiles = profiles_filter

    end

    @markers = @profiles.map do |profile|
      {
        lat: profile.latitude,
        lng: profile.longitude

      }
    end
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
    params.require(:profile).permit(:name, :age, :gender, :address, :photo, interest: [])
  end

  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end
end
