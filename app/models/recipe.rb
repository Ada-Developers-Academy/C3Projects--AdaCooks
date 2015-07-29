class Recipe < ActiveRecord::Base
# Associatons ------------------------------------------------------------------
	belongs_to :cookbook
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

# Validations ------------------------------------------------------------------
	validates :name, :description, :prep, presence: true

# Scopes -----------------------------------------------------------------------
	# returns ALL recipes - do I want that, really…?
	scope :alphabetize, -> { Recipe.order(name: :asc) }
end
