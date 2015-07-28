class Recipe < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_many :ingredients
  has_and_belongs_to_many :cookbooks
  #Validations-------------------------------------------------------------------
  validates :name, presence: true
  # validates :description
  validates :instructions, presence: true
  # validates :ing_photo
  #Scopes------------------------------------------------------------------------
end
