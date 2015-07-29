class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find(session[:user_id])
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :image)
  end

end
