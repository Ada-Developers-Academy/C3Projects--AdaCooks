class UsersController < ApplicationController
  before_action :set_user_for_profile, only: :show

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
    def set_user_for_profile
      @user = User.find(params[:user_id])
    end

    def create_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
