class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(valid_user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:errors] = ERRORS[:registration_error]
      render :new
    end
  end

  private

  def valid_user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
