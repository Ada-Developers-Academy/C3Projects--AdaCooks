class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :measurements
  has_many :measurements
  belongs_to :user
  mount_uploader :image, ImageUploader

  scope :by_name, -> { order(:name) }
end
