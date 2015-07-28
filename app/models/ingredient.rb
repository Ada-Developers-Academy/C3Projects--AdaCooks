class Ingredient < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :recipes
  #Validations-------------------------------------------------------------------
  validates :name, required: true, uniqueness: true
  # validates :image
  #Scopes------------------------------------------------------------------------
end
