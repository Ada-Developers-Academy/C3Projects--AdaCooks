class RecipeIngredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :recipe, inverse_of: :recipe_ingredients
  belongs_to :ingredient
  belongs_to :measurement

  # Validations ----------------------------------------------------------------
  validates :recipe, presence: true
  validates :ingredient_id, presence: true
end
