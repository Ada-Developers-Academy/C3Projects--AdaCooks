class Recipe < ActiveRecord::Base
	mount_uploader :image_url, ImageUploader

# Associatons ------------------------------------------------------------------
	belongs_to :cookbook
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	accepts_nested_attributes_for :recipe_ingredients

# Validations ------------------------------------------------------------------
	validates :name, :description, :prep, presence: true

# ----------MOUNTED-OBJECTS-----------------------------
  mount_uploader :image, ImageUploader

# Scopes -----------------------------------------------------------------------
	# returns ALL recipes - do I want that, really…?
	scope :alphabetize, -> { Recipe.order(name: :asc) }

end
