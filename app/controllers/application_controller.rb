class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  ERRORS = {
    login_error: "Invalid login. Please try again.",
    not_logged_in: "Please log in to see this page.",
    registration_error: "Please try again."
  }

  # before action for new forms for which you need to be an identified user
  def require_login
    redirect_to login_path, flash: { errors: ERRORS[:not_logged_in] } unless session[:user_id]
  end

  # before action for being able to edit and delete recipes and ingredients
  # or access user cookbooks
  def correct_user
    logged_in_user = User.find(session[:user_id])
    redirect_to user_path(logged_in_user) unless params[:user_id] == logged_in_user.id
  end

end
