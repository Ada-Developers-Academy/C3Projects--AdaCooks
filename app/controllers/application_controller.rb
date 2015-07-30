class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_search, :set_user_name

  def set_user_name
    @user = User.find_by(id: session[:user_id])

    @user_name = @user ? @user.name : "Guest"
  end

  def check_search
    if params[:search]
        @search_results = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", "%#{params[:search][:query]}%")
    end
  end
end
