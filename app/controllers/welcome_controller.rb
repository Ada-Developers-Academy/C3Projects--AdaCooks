class WelcomeController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @recipes = Recipe.all.order(:name).limit(20)
    @ingredients = Ingredient.all.order(:name).limit(20)
    @cookbooks = Cookbook.where(user_id: session[:user_id]).order(:name).limit(20)
  end
end
