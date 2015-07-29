class SessionsController < ApplicationController


  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), method: :get
    else
      flash.now[:login_error] = "Try again"
      render :new
    end
  end
end
