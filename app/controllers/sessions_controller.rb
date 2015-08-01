class SessionsController < ApplicationController
  MESSAGES = {
    signin_success: "Sign in successful. Go forth and conquer your coolest ice cream dreams.",
    signin_fail: "I scream, you scream, we're all screaming about your signin attempt.",
    signout_success: "It was n-ice while it lasted."
  }

  def create
    user = User.find_by_username(params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = MESSAGES[:signin_success]
      redirect_to my_recipes_path
    else
      flash[:errors] = MESSAGES[:signin_fail]
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = MESSAGES[:signout_success]
    redirect_to root_path
  end
end
