class Cookbook < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

  #Associations
  has_and_belongs_to_many :recipes
  has_many :ingredients, :through => :recipes
  belongs_to :user
end
