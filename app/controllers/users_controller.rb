class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cookbooks = @user.cookbooks

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(create_params[:user])

    if user.save
      redirect_to login_url
    else
      redirect_to new_user_path
    end
  end

 private

  def create_params
    params.permit(user: [:name, :email, :password, :password_confirmation])
  end
end
