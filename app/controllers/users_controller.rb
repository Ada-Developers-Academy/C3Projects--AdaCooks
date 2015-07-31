class UsersController < ApplicationController

  def new
    if session[:user_id].nil?
      @user = User.new
      render :new
    else
      flash[:errors] = ERRORS[:account_exists]
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path # TODO: change this path
    else
      flash.now[:errors] = ERRORS[:unsuccessful_signup]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @cookbooks = Cookbook.where(user_id: session[:user_id])
    @recipes = Recipe.where(user_id: params[:id])
    @ingredients = Ingredient.where(user_id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :image, :password)
  end
end
