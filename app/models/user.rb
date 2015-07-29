class User < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_many :recipes, through: :cookbooks
  has_many :recipes
  has_many :cookbooks

  has_secure_password
  #Validations-------------------------------------------------------------------
  validates :username, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  #Scopes------------------------------------------------------------------------
  #Mounted Objects---------------------------------------------------------------
  mount_uploader :image, ImageUploader

end
