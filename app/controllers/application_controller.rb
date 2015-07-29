class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :logged_in

  MESSAGES = {
    successful_login: "You have successfully logged in! Nice work!",
    successful_logout: "You have logged out. We'll miss you.",

  }

  ERRORS = {
    login_error: "Invalid login. Please try again!",
    login_required: "You must be logged in to view this page!",
    account_exists: "You already have an account!",
    unsuccessful_signup: "There was a problem with your signup info. Please try again!",
    unsuccessful_save: "Could not save. Please check the information and try again.",
    wrong_login: "That's not your login! You can't access another Chef's secret sauce."
  }

  def require_login
    unless session[:user_id]
      redirect_to login_path, flash: { errors: ERRORS[:login_required] }
    end
  end

  def logged_in
    @user = User.find(session[:user_id]) unless session[:user_id].nil?
    # Send the user to the home page if they try to access another user's pages
    flash: { errors: ERRORS[:wrong_login] }
    redirect_to root_path unless params[:user_id].to_i == @user.id
  end
end
