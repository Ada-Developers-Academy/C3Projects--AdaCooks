class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :cookbooks
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true
end
