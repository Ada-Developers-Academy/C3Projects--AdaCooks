class Ingredient < ActiveRecord::Base
# Associations --------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user

# Mounted Objects -----------------------------------------------
  mount_uploader :image, ImagesUploader

# Validations ---------------------------------------------------
  validates :name, presence: true, uniqueness: true

# Scopes --------------------------------------------------------
  scope :alpha_order, -> { order(name: :asc) }

end
