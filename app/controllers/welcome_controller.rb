class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])

      @recipes = Recipe.order(:name)
      @ingredients = Ingredient.order(:name)

      if params[:search]
        # @search_results = Recipe.ingredients.search(params[:search]).order(:name)
        # @search_results = Recipe.joins(:ingredients).where("ingredient.name like '%#{?}%'", params[:search] )
        # # users.joins(:posts).where(title_array.map{|title| "posts.title like '%#{title}%'"}.join(' or '))

        # search = "%" + params[:search] + "%"
        # @persons = People.where("persons.name LIKE ?", search)
        search = "%" + params[:search] + "%"
        @search_results = Recipe.joins(:ingredients).where("ingredient.name LIKE ?", search)

      end

    end
  end
end

# def self.search(query)
#   where("name like ?", "%#{query}%")
# end
