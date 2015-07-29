class Ingredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :recipes, through: :recipe_ingredients
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
end
