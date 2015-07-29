class Cookbook < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_and_belongs_to_many :recipes, :join_table => "cookbooks_recipes"
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true
  validates :user_id, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :alphabetical, -> { order("name") }

  def unique_ingredient_count
    ingredient_list = []
    recipes.each do |recipe|
      ingredient_list << recipe.ingredients.pluck
    end
    ingredient_list = ingredient_list.flatten.uniq
    return ingredient_list.count
  end
end
