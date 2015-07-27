class Recipe < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :preparation, presence: true
  validates :ingredients, presence: true
end
