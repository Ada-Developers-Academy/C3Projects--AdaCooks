class UsersController < ApplicationController
  before_action :current_user, except: [:new, :create]
  before_action :set_user, only: [:show, :update]

  before_action :require_signin, only: [:my_recipes, :my_cookbooks, :my_ingredients, :edit]

MESSAGES = {
    update_success: "You have successfully updated your profile.",
    update_fail: "There was a problem with your update. Please try again."
}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to my_recipes_path
    else
      render :new
    end
  end

  def show
    @recipes = @user.recipes
  end

  def edit
    @user = @current_user
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = MESSAGES[:update_success]
      redirect_to @user
    else
      flash[:errors] = MESSAGES[:update_fail]
      render :edit
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
