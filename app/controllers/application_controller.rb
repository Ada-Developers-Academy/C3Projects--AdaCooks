class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    redirect_to root_path if !session[:user_id]
  end

  def error_messages(instance)
    error_array = []
    instance.errors.messages.each do |key, value|
      error_array += [[key.to_s.capitalize, value.first]]
    end
    error_array
  end
end
