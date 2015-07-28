class UsersController < ApplicationController

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

###############################
  private 

  def create_params
    params.permit(user: [:username, :password, :password_confirmation, :image])
  end

end
