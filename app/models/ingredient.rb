class Ingredient < ActiveRecord::Base
  has_many :recipes, -> { uniq }, through: :measurements
  has_many :measurements, dependent: :destroy # TODO: test this
  has_many :cookbooks, through: :recipes
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :name, uniqueness: true, presence: true # TODO: add validation tests

  scope :by_name, -> { order(:name) }

  def owner?(session_id) # TODO: test this
    user_id == session_id
  end
end
