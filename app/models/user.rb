class User < ActiveRecord::Base
  #Associations
  has_secure_password
  # Mounted Objects
  mount_uploader :image, ImageUploader
end
