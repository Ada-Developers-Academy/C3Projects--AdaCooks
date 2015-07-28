class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:session][:password]
    session[:user_id] = params[:user][]
  end

  def destory
  end

  def authenticated?
    if params[:session][:password] == User.find_by(email: params[:session][:email]).password
      return true
    else
      return false
    end
  end

end
