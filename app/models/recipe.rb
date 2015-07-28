class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_and_belongs_to_many :ingredients
  belongs_to :cookbooks
  belongs_to :user

# VALIDATIONS -----------------------------------------
  validates :name, presence: true
  validates :prep, presence: true
  validates_associated :ingredients

# SCOPES ----------------------------------------------
  # scope :find_recipe, ->
end
