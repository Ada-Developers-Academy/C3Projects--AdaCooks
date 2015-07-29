class User < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

  # Validations ----------------------------------------------------------------
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # Instance Methods -----------------------------------------------------------
  def has_recipes? # FIXME: test #has_recipes
    recipes && recipes.length > 0
  end

  def has_ingredients? # FIXME: test #has_ingredients
    ingredients && ingredients.length > 0
  end
end
