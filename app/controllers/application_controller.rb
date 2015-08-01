class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :last_page
  helper_method :require_signin

  MESSAGES = { 
    not_signed_in: "Please sign in to access that page." 
  }

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_signin
    unless @current_user
      flash[:errors] = MESSAGES[:not_signed_in]
      redirect_to signin_path
    end
  end

  def last_page
    session[:last_page] = request.referer || :back
  end
end
