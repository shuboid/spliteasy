class EventsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user

  def index
    @events = Event.all
    respond_to do |format|
      format.html { render :index}
    end
  end


  def create
    event_params = filter_params
    payments = params[:event][:payment]

    event = Event.create(event_params)
    event.create_payments(payments)

    respond_to do |format|

    end

  end

  def balance
    @friend_balance_sheet = @user.get_balance_sheet
  end

  def update
  end

  def filter_params
    params.require(:event).permit(:name, :location, :total_amount, :user_ids => [])
  end

end
