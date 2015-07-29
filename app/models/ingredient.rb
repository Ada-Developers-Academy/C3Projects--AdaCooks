class Ingredient < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

    #Associations
    has_and_belongs_to_many :recipes
    belongs_to :user
    
end
