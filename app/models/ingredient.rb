class Ingredient < ActiveRecord::Base
  belongs_to :recipe

# -------------VALIDATIONS----------------------
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  # -------------SCOPES----------------------
  def self.alphabetize
    order('name')
  end
end
