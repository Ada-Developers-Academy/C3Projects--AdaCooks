class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :measurements
  has_many :measurements
  has_many :cookbooks, through: :recipes
  belongs_to :user
  mount_uploader :image, ImageUploader
end
