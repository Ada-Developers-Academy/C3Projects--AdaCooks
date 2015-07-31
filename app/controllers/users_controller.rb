class UsersController < ApplicationController
  before_action :registered_user, only: [:new]

  include ApplicationHelper

  def show
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      if session[:user_id] == @current_user
        @user = User.find(session[:user_id])
        @cookbooks = @user.cookbooks
        @recipes = @user.recipes
      else
        load_user_cookbooks
      end
    else
      load_user_cookbooks
    end
  end

  def load_user_cookbooks
    @user = User.find(params[:id])
    @cookbooks = @user.cookbooks
    @recipes =@user.recipes
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
