class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def new; end

  def create
    # login using username
    if @user && @user.authenticate(params[:session][:password]) # user was found
      session[:user_id] = @user.id # setting session to the user.id
      redirect_to user_path(@user)
    else # user wasn't found
      flash.now[:errors] = ERRORS[:login_error]
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find_by(username: params[:session][:username])
    end
end
