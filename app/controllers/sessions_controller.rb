class SessionsController < ApplicationController
  def login; end

  def create # session, actually logging in
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_cookbooks_path(user)
    else
      flash.now[:error] = "Invalid username or password. Please try again."
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
