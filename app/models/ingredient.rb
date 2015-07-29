class Ingredient < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

    #Associations
    belongs_to :user
    
end
