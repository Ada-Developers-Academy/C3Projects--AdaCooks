class Recipe < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

    #Associations
    has_many :ingredients
    belongs_to :user
end
