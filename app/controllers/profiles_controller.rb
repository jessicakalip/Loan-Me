class ProfilesController < ApplicationController
  def new
    #@gender_list = Profile::GENRES
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
    params.require(:profile).permit(:name, :interest, :age, :gender)
  end
end
