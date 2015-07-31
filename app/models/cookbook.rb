class Cookbook < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :ingredients, through: :recipes
  has_and_belongs_to_many :recipes

  # Validations
  validates :name, presence: true, uniqueness: true
end
