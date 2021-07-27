class HangoutsController < ApplicationController
  def show
    @id = params[:id]
    @hangout = Hangout.find(@id)
  end
end
