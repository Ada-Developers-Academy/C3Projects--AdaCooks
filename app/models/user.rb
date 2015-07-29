class User < ActiveRecord::Base
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

  has_secure_password

  def has_recipes? # FIXME: test #has_recipes
    recipes && recipes.length > 0
  end

  def has_ingredients? # FIXME: test #has_ingredients
    ingredients && ingredients.length > 0
  end
end
