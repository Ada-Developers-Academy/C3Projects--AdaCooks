class Cookbook < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user
  
  #Validations-------------------------------------------------------------------
  validates :name, presence: :true

  #Scopes------------------------------------------------------------------------

  def unique
    special_ingredients = []
    really_special_ingredients = []
    recipes.each do |recipe|
      special_ingredients <<  recipe.ingredients.flatten
      special_ingredients.flatten.each do |ingredient|
        really_special_ingredients << ingredient
      end
    end
    
    really_special_ingredients = really_special_ingredients.flatten.uniq
    return really_special_ingredients.count
  end
end
