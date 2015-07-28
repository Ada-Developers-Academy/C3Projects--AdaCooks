class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      redirect_to login_url
    else
      redirect_to signup_path
    end

  end

  def show
    @user = User.find(session[:user_id])
    @cookbooks = Cookbook.all
  end


private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
