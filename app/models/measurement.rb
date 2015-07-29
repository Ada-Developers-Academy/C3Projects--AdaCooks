class Measurement < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :recipe_ingredients
  
  # Validations ----------------------------------------------------------------
  validates :unit, presence: true, uniqueness: true
end
