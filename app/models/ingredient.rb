class Ingredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :recipes

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Scopes ---------------------------------------------------------------------
  scope :alphabetized, -> { order("name ASC") }

  # Mounted Objects ------------------------------------------------------------
  mount_uploader :avatar, AvatarUploader

  # Instance Methods -----------------------------------------------------------
  def proper_name # FIXME: test Ingredient#proper_name
    name.titlecase
  end
end
