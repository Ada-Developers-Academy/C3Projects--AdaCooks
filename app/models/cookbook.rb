class Cookbook < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :recipes
  belongs_to :user
  has_many :ingredients, through: :recipes

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true

  def ingredient_count
    ingredients.uniq.count
  end

  def recipe_count
    recipes.count
  end
end
