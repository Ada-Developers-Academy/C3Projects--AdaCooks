class SessionsController < ApplicationController
  before_action :assign_user, only: [:create]

  def new
  end

  def create

    unless @user.nil?
      if @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to :back
      else
        flash[:alert] = "Invalid password."
        render :new
      end
    else
      flash[:alert] = "#{params[:session][:email]} is not a registered email address."
      render :new
    end

  end

  def destory
    session[:user_id] = nil
    flash.now[:success] = "You have successfully logged out. Congradulations!"
    redirect_to root_path
  end
  
  private
  
  def assign_user
    @user = User.find_by(email: params[:session][:email])
  end

end
