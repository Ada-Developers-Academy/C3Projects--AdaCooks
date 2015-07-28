class Ingredient < ActiveRecord::Base
  def index
  @ingredients = Ingredient.all
  end
end
