class Recipe < ActiveRecord::Base
# Associations --------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks

# Mounted Objects -----------------------------------------------
  mount_uploader :image, ImagesUploader

# Validations ---------------------------------------------------
  validates :name, presence: true
  validates :preparation, presence: true
  validates :ingredients, presence: true

# Scopes --------------------------------------------------------
  scope :alpha_order, -> { order(name: :asc) }

  def self.search(search)
    where('name LIKE ? OR description LIKE ? OR preparation LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
