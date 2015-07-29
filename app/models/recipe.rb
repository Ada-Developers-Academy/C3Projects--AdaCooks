class Recipe < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user
  #Validations-------------------------------------------------------------------
  validates :name, presence: true
  # validates :description
  validates :instructions, presence: true
  # validates :ing_photo
  #Scopes------------------------------------------------------------------------
  #Mounted Objects---------------------------------------------------------------
  mount_uploader :image, ImageUploader
end
