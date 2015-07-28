class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:messages] = MESSAGES[:successful_login]
      redirect_to root_path
    else
      flash[:errors] = ERRORS[:login_error]
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:messages] = MESSAGES[:successful_logout]
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by(username: params[:session][:username])
  end

end
