class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @hangouts = Hangout.where(user: current_user)
  end

  def components
    @profiles = Profile.all.sample(6)
    @hangouts = Hangout.all.sample(5)
  end
end
