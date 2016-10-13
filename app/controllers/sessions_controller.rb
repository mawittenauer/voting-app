class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in!"
      redirect_to new_campaign_path
    else
      flash.now[:danger] = "There was a problem with your email/password."
      render :new
    end
  end
end
