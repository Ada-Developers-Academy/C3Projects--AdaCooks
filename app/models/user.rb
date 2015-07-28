class User < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_many :recipes through: :cookbooks
  has_many :recipes
  has_many :cookbooks
  #Validations-------------------------------------------------------------------
  validates :username, uniqueness: true
  validates :password
  # validates :user_photo
  #Scopes------------------------------------------------------------------------
end
