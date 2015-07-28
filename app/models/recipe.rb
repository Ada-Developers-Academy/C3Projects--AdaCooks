class Recipe < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients
  belongs_to :user

  # Mounted Objects
  mount_uploader :image, ImageUploader

  # Validations
  validates :name, presence: true
  validates :preparation, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

end
