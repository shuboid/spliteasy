class UsersController < ApplicationController

  before_action :load_user

  def index
    users = User.all.collect{|user| {id: user.id.to_s, text: user.name} }
    respond_to do |format|
      format.json {render json: users}
    end
  end

  def update
  end
  def show
    @friend_list = User.where(:_id.in => @user.friend_ids ).entries
  end

  def get_friends
    friends = User.where(:_id.in => @user.friend_ids ).entries
    friends = friends.collect{|user| {id: user.id.to_s, text: user.name} }
    respond_to do |format|
      format.json {render json: friends}
    end
  end

  def add_friend
    friend = params[:friend_list]
    @user.friend_ids << friend
    @user.save!
  end

  def add_transction
    payer = params[:payer]
    payee = params[:payee]
    amount = params[:amount]
    transcation = Transaction.new(payer_id: payer, payee_id: payee, amount: amount)
    transcation.save!
    redirect_to balance_events_path
  end

end
