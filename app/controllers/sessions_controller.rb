class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      flash.now[:error] = "Incorrect Username/Password Combination, Please Try Again or Sign Up as A New Vendor"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
