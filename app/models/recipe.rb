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
  # one or more ingredients required, need to look up how to do this validation

# Scopes --------------------------------------------------------
  scope :alpha_order, -> { order(name: :asc) }

  def self.search(search)
    # the below line works but I couldn't figure out how to get it to play
    # nicely with the other search query, so I went with the broader one
    self.includes(:ingredients).where("ingredients.name" => "#{search}")
    # where('name LIKE ? OR description LIKE ? OR preparation LIKE ?',
    #       "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
