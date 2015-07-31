class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @recipes = Recipe.all.order(:name)
    @ingredients = Ingredient.all.order(:name)
    @cookbooks = Cookbook.where(user_id: session[:user_id]).order(:name)
  end
end
