class HomeController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @user = User.find(session[:user_id])
    end
    @recipes = Recipe.all
    @cookbooks = Cookbook.all
  end
end
