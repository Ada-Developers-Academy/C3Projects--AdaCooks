class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])

      @recipes = Recipe.order(:name)
      @ingredients = Ingredient.order(:name)
    end
  end
end
