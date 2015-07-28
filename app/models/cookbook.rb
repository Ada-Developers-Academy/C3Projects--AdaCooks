class Cookbook < ActiveRecord::Base
  # Associations ---------------------------------------------
  belongs_to :user
  has_many :recipes
  has_many :ingredients, through: :recipes

  # Validations ----------------------------------------------

end
