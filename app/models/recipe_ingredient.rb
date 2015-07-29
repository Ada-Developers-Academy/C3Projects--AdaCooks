class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  # how could you make these pluralize when needed?
  MEASUREMENTS = ["", "tsp", "tbsp", "cup", "ounce", "gram", "pound", "piece"]

  # getter - for edit
  def ingredient_name
    # ingredient.nil? ? nil : ingredient.name
    # doesn't need self cause it'll check for a variable first which doesn't exist
    # then it'll check for an object
    ingredient.try :name
  end

  # setter - for creating
  def ingredient_name=(name)
    # use self to assign to object
    self.ingredient = Ingredient.where(name: name).first_or_create
  end
end
