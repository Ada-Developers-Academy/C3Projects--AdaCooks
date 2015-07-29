class Recipe < ActiveRecord::Base
  # Associations ----------------------------------
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true
  validates :preparation, presence: true

  # Mounted Objects_____________________________________________________________
  mount_uploader :image, ImageUploader #instance of class image uploader

end
