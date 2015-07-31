class Cookbook < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes

  # Validations
  validates :name, presence: true, length: { maximum: 25 }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Instance Methods -----------------------------------------------------------
  def remove_recipe_association(recipe_id)
    recipe = Recipe.find(recipe_id)
    recipes.delete(recipe)
  end

  def add_recipe_association(recipe)
    recipes << recipe
  end

  def uniq_ingredients
    ingredients.uniq.count
  end

  def proper_name # FIXME: test Cookbook#proper_name
    name.titlecase
  end
end
