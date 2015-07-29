class UsersController < ApplicationController

  def new
    # we don't want the user to be logged in when making a new account
    if session[:user_id].nil?
      @user = User.new
      render :new
    # if the user IS logged in, don't let them make a new account
    else
      flash[:warning] = "You can't make a new account while you're currently logged in."
      redirect_to root_path
    end
  end

  def create # also logs in the user
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Thank you for creating an account with us!"
      session[:user_id] = @user.id # creates a session - they are logged in
      redirect_to dash_user_path(@user)
    else # if they entered invalid info
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :bio)
  end

end
