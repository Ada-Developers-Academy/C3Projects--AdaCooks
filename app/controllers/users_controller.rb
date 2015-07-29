class UsersController < ApplicationController
  before_action :correct_user, except: [:new, :create]
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    # @recipes = @user.recipes
    # @cookbooks = @user.cookbooks
  end

private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
