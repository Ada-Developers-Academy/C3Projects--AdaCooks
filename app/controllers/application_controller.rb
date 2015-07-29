class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # if trying to access a location as a non-logged in user
  def require_login
    redirect_to new_session_path,
      flash: { warning: "You need to be a signed-in user." } unless session[:user_id]
  end

  # to make an accessible user variable for the header, if logged in
  def set_logged_in_user
    @user = User.find(session[:user_id]) unless session[:user_id].nil?
  end
end
