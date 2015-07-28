class Recipe < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  mount_uploader :image, RecipesUploader
end
