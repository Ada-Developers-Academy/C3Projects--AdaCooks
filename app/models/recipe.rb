class Recipe < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Associations
  belongs_to :user
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients

  # Validations
  validates :name, presence: true
  validates :preparation, presence: true

  # look up join table validations when we get a sec
  # validates :ingredients, presence: true, uniqueness: true
  # Elsa's answer: probably custom validations on create
end
