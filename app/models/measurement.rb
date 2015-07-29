class Measurement < ActiveRecord::Base
  has_many :recipe_ingredients
  # Validations ----------------------------------------------------------------
  validates :unit, presence: true
end
