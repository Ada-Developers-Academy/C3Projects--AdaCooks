class Recipe < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader

    #Associations
    has_and_belongs_to_many :cookbooks
    has_and_belongs_to_many :ingredients
    belongs_to :user
end
