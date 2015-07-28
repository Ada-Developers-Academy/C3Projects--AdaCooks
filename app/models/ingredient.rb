class Ingredient < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :recipes
  belongs_to :user
  has_many :cookbooks, through: :recipes

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
end
