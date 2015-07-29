class RecipeIngredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measurement

  # Validations ----------------------------------------------------------------
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true
end
