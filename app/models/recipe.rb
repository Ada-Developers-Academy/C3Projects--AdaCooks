class Recipe < ActiveRecord::Base
# Associatons ------------------------------------------------------------------
	belongs_to :cookbook
	has_many   :ingredients

# Validations ------------------------------------------------------------------
	validates :name, :description, :prep, presence: true

# Scopes -----------------------------------------------------------------------
	# returns ALL recipes
	scope :alphabetize, -> { Recipe.order(name: :asc) }
end
