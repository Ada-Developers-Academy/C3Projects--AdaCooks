class Cookbook < ActiveRecord::Base

# associations ________________________________________________________________
  belongs_to :user
  has_many :ingredients, through: :recipes

# Validations ________________________________________________________________
  validates :name, presence: true
end
