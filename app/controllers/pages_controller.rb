class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    redirect_to(profiles_path) if user_signed_in?
  end

  def dashboard
    @hangouts = Hangout.where(user: current_user)
    @requests = Hangout.where(profile: current_user.profile)
  end

  def components
    @profiles = Profile.all.sample(6)
    @hangouts = Hangout.all.sample(5)
  end
end
