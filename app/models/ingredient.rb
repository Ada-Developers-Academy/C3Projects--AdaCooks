class Ingredient < ActiveRecord::Base
  has_many :recipes, -> { uniq }, through: :measurements
  has_many :measurements
  has_many :cookbooks, through: :recipes
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :name, uniqueness: true, presence: true # TODO: add validation tests

  scope :by_name, -> { order(:name) }
end
