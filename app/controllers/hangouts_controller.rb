class HangoutsController < ApplicationController
  def index
    @hangouts = Hangout.all
  end

  def show
    @id = params[:id]
    @hangout = Hangout.find(@id)
  end
end
