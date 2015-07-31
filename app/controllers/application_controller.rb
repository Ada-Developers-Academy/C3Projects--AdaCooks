class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  ERRORS = {
    login_error: "Invalid login. Please try again.",
    not_logged_in: "Please log in to see this page.",
    registration_error: "Please try again.",
    new_recipe_error: "A recipe needs to have a name and preparation.",
    unauth_user_error: "You are not authorized to see this information."
  }

  # before action for new forms for which you need to be an identified user
  def require_login
    redirect_to login_path, flash: { errors: ERRORS[:not_logged_in] } unless session[:user_id]
  end
end
