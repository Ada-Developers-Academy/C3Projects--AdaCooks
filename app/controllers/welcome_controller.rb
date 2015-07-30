class WelcomeController < ApplicationController
  def index
    session[:user_id] ? @user = User.find_by(id: session[:user_id]) : @user = "Guest"

      @recipes = Recipe.order(:name)

      @ingredients = Ingredient.order(:name)

      if params[:search]
        @search_results = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", "%#{params[:search][:query]}%")
      end
  end
end

# def self.search(query)
#   where("name like ?", "%#{query}%")
# end
