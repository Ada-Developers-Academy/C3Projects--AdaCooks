class UsersController < ApplicationController
  # before_filter :authorize, only: [:dashboard]
  before_action :current_user, only: [:my_recipes, :my_cookbooks, :my_ingredients]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      # redirect to dashboard_path(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def my_recipes
    @recipes = @current_user.recipes.desc_by_update
  end

  def my_cookbooks
    @cookbooks = @current_user.cookbooks.alphabetical
  end

  def my_ingredients
    @ingredients = @current_user.ingredients
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
