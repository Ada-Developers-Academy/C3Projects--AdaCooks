class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :recipes)
  end
end
