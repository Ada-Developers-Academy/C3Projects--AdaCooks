class Cookbook < ActiveRecord::Base
  # Mounted Objects
  mount_uploader :image, ImageUploader
end
