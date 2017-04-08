class EventsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @events = Event.all
    respond_to do |format|
      format.html { render :index}
    end
  end


  def create
  end

  def update
  end

end
