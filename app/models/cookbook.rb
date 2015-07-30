class Cookbook < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def remove_recipe_association(recipe_id)
    recipe = Recipe.find(recipe_id)
    recipes.delete(recipe)
  end

  # Instance Methods -----------------------------------------------------------
  def proper_name # FIXME: test Cookbook#proper_name
    name.titlecase
  end
end
