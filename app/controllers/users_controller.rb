class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      AuthenticationMailer.authentication_email(@user).deliver_now
      flash[:success] = "You have successfully registered. Check your email to activate your account!"
      redirect_to sign_in_path
    else
      flash.now[:danger] = "There were the following errors with your submission."
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:password, :email, :full_name)
  end
end
