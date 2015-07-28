class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  MESSAGES = {
    successful_login: "You have successfully logged in! Nice work!",
    successful_logout: "You have logged out. We'll miss you."
  }

  ERRORS = {
    login_error: "Invalid login. Please try again!",
    login_required: "You must be logged in to view this page!"
  }

  def require_login
    unless session[:user_id]
      redirect_to login_path, flash: { errors: ERRORS[:login_required] } 
    end
  end
end
