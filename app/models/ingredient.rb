class Ingredient < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user
  #Validations-------------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
 
  #Scopes------------------------------------------------------------------------
  #Mounted Objects---------------------------------------------------------------
  mount_uploader :image, ImageUploader
end
