class RecipeIngredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :recipe, inverse_of: :recipe_ingredients
  belongs_to :ingredient
  belongs_to :measurement

  # Validations ----------------------------------------------------------------
  # mahalo @_jnf, for pointing out this needs to validate :recipe, not :recipe_id
  validates :recipe, presence: true
  validates :ingredient_id, presence: true
end
