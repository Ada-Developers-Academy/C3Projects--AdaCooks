class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :measurements
  has_many :measurements
  mount_uploader :image, ImageUploader
end
