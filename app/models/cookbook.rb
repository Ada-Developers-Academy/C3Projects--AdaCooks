class Cookbook < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user
  
  #Validations-------------------------------------------------------------------
  validates :name, presence: :true

  #Scopes------------------------------------------------------------------------

  def unique
    special_ingredients = []
    recipes.each do |recipe|
    special_ingredients <<  recipe.ingredients.pluck    
    end
    special_ingredients = special_ingredients.uniq
        raise

    return special_ingredients.count
  end
end
