class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_many :ingredients, inverse_of: :order
  has_and_belongs_to_many :cookbooks
  belongs_to :user

# VALIDATIONS -----------------------------------------
  validates :name, presence: true, uniqueness: true
  validates :prep, presence: true
  validates_associated :ingredients
end
