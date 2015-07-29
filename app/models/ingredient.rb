class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

# -------------VALIDATIONS----------------------
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  # -------------SCOPES----------------------
  def self.alphabetize
    order('name')
  end
end
