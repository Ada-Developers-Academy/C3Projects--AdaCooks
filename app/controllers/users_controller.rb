class UsersController < ApplicationController
  before_action :require_login, only: [:show]

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
    @cookbooks = Cookbook.where(user_id: @user.id )
    @recipes = Recipe.where(user_id: @user.id )
    @ingredients = Ingredient.where(user_id: @user.id)
  end

  def view
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
