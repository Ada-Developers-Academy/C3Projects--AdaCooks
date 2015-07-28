class Recipe < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Associations
  belongs_to :user
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients

  # Validations
  validates :name, presence: true
  validates :preparation, presence: true
  validates :ingredients, presence: true, uniqueness: true
end
