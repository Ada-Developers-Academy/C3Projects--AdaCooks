class Recipe < ActiveRecord::Base
# Associatons ------------------------------------------------------------------
	belongs_to :cookbook
	has_many   :ingredients

# Validations ------------------------------------------------------------------
	validates :name, :description, :prep, presence: true
end
