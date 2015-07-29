class UsersController < ApplicationController

  def index
    @users = User.all.order('username ASC')
  end

  def show
    @user = User.find(params[:id])
    @recipes = User.find(params[:id]).recipes
    @ingredients = User.find(params[:id]).ingredients
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      # update to take to user dashboard later
    else
      redirect_to signup_path
    end
  end

  def dashboard
    if session[:user_id] == params[:user_id].to_i
      @user = User.find(params[:user_id])

      @recipes = Recipe.where(user_id: @user.id)

    else
      flash[:error] = "You don't have access to this Dashboard"
      redirect_to root_path
    end

  end

###############################
  private

  def create_params
    params.permit(user: [:username, :password, :password_confirmation, :image])
  end

end
