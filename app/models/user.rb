class User < ActiveRecord::Base
  # Validations
  validates :username, uniqueness: true

  # Mounted Objects
  mount_uploader :image, ImageUploader

  # Associations
  has_secure_password
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients
end
