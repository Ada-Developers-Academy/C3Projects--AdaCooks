class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.alphabetical_ingredients
    order('name')
  end
end
