class SessionsController < ApplicationController
  before_action :assign_user, only: [:create]

  def new
    if session[:user_id].nil?
      render :new
    # if the user IS logged in, don't let them sign in again
    else
      flash[:warning] = "You are already logged in, silly!"
      redirect_to root_path
    end
  end

  def create
    if @user.nil? && params[:session][:email].any?
      flash[:alert] = "#{params[:session][:email]} is not a registered email address."
      render :new
    elsif @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = "You have successfully logged out. Congradulations!"
    redirect_to root_path
  end

  private

  def assign_user
    @user = User.find_by(email: params[:session][:email])
  end

end
