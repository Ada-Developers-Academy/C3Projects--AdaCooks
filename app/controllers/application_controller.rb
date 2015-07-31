class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_user

  def require_user_login
    unless session[:user_id] == params[:user_id].to_i
      flash[:error] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def set_user
    if session[:user_id]
      @authenticated_user = User.find(session[:user_id])
    end
  end
end
