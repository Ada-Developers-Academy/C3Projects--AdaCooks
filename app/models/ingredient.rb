class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :measurements
  has_many :measurements
  belongs_to :user
  mount_uploader :image, ImageUploader
end
