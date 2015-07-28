class Cookbook < ActiveRecord::Base

# associations ________________________________________________________________
  belongs_to :user
  has_many :recipes
  has_many :ingredients, -> { uniq }, through: :recipes

# Validations ________________________________________________________________
  validates :name, presence: true
end
