class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  MESSAGES = {
    not_signed_in: "Please sign in to access that page.",
    signed_in: "Sign in successful. Enjoy your ice cream!"
  }

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authorize
    if current_user
      flash[:success] = MESSAGES[:signed_in]
    else
      redirect_to signin_path
      flash[:errors] = MESSAGES[:not_signed_in]
    end
  end
end
