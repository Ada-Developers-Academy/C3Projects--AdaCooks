class Ingredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  belongs_to :user

  # Mounted Objects -------------------------------------------------------------
  mount_uploader :image, ImageUploader
  
  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
end
