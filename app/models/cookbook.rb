class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  has_many :ingredients, through: :recipes

# ----------VALIDATIONS------------------------------
  validates :name, presence: true, uniqueness: true

# ----------SCOPES------------------------------
  def self.alphabetize
    order('name'.capitalize)
  end

# ----------MODEL METHODS------------------------------
  def self.unique_ingredients
    array = self.ingredients
    ingredient_array = array.uniq{|ingredient| ingredient.name}
    ingredient.count
  end
end
