class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  mount_uploader :image, ImagesUploader
end
