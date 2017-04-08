class ApplicationController < ActionController::Base


  def load_user
    if current_user
      @user =  current_user
    end
  end
end
