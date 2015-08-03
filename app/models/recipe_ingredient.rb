class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  # how could you make these pluralize when needed?
  MEASUREMENTS = ["tsp", "tbsp", "cup", "ounce", "gram", "pound", "piece"]

  # getter - for edit
  def ingredient_name
    # doesn't need self cause it'll check for a variable first which doesn't exist
    # then it'll check for an object
    # same as `ingredient.nil? ? nil : ingredient.name`
    ingredient.try :name

    # if you find the ingredient
    # don't create a new RecipeIngredient
    # find the RecipeIngredient with the recipe_id and the ingredient_id
    # and return that instead
  end

  # setter - for creating
  def ingredient_name=(name)
    # use self to assign to object
    self.ingredient = Ingredient.where(name: name).first_or_create
  end
end
