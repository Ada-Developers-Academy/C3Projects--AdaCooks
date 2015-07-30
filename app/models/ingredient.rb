class Ingredient < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  # Associations
  belongs_to :user
  has_and_belongs_to_many :recipes

 # Validations
  validates :name, presence: true, uniqueness: true

  # Mounted object
  mount_uploader :image, ImageUploader
end
