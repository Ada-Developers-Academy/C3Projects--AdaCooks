class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(valid_user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      flash.now[:errors] = ERRORS[:registration_error]
      render :new
    end
  end

  private

  def valid_user_params
    params.require(:user).permit(:username, :password_digest)
  end
end
