class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      if user.activated?
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in!"
        redirect_to campaigns_path
      else
        flash[:danger] = "Check your email to activate your account."
        redirect_to sign_in_path
      end
    else
      flash.now[:danger] = "There was a problem with your email/password."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out."
    redirect_to sign_in_path
  end
end
