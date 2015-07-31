class UsersController < ApplicationController
  before_action :require_login, only: [:dashboard]
  before_action :check_user_params, only: [:dashboard]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_user_path(@user)
    else
      flash.now[:error] = "Registration failed, try again."
      render :new
    end
  end

  def dashboard
    @user = User.find(session[:user_id])

    @recipes = @user.recipes
    @cookbooks = @user.cookbooks
  end

  def profile
    @user = User.find(params[:user_id])
    @cookbooks = Cookbook.where(user_id: @user.id)
    @recipes = Recipe.where(user_id: @user.id)
    @ingredeints = Ingredient.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :recipes, :cookbooks, :ingredients)
  end
end
