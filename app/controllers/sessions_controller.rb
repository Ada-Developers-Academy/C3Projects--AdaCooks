class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    unless @user.nil?
      if @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to root_path
        # TODO Don't know how to redirect back, that'd be better. Lookup.
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
    redirect_to root_path
  end

end
