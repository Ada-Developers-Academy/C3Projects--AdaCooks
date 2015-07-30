class HomeController < ApplicationController
  def root; end

  def search
    query = params[:search][:query].downcase

    ingredients = Ingredient.all.select{ |ingredient| ingredient.name[0].downcase == query[0] }

    @match = ingredients.select { |ingredient| ingredient.name.downcase == query }.pop
    
    unless @match
      flash[:error] = "Sorry, we couldn't find your ingredient."
      redirect_to root_path
    end
  end
end
