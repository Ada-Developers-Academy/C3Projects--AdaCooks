class Ingredient < ActiveRecord::Base
  # uploader ------
  mount_uploader :image, ImageUploader
  # Associations ----------------------------------
  has_and_belongs_to_many :recipes

  # Validations ------------------------------------
  validates :name, presence: true, uniqueness: true

  # Scopes -----------------------------------------
  scope :alphabet, -> { order('lower (name)') }


end
