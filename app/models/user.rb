class User < ActiveRecord::Base
  #Associations
  has_secure_password
  # Mounted Objects
  mount_uploader :image, ImageUploader

    #Associations
    has_many :cookbooks
    has_many :recipes
    has_many :ingredients
end
