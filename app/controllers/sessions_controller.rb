class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id

      redirect_to dashboard_user_path(@user)
    else
      flash.now[:login_error] = "Login failed, try again."

      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
