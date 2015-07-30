class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.create(create_params)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_cookbooks_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages.first
      render :signup
    end
  end

  def show; end

  private
    def create_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
