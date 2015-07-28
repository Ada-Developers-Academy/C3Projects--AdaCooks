class Cookbook < ActiveRecord::Base
# Associations --------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes

# Validations ---------------------------------------------------
  validates :name, presence: true
  validates :user_id, presence: true
end
