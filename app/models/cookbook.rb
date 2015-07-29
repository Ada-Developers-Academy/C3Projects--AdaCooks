class Cookbook < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

  #Associations
  has_many :recipes
  has_many :ingredients, :through => :recipes
  belongs_to :user
end
