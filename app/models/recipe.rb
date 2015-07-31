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
    # the below query works! thanks to class for grumble help
    self.includes(:ingredients).where("ingredients.name like ? OR recipes.name LIKE ?"
        "OR recipes.description LIKE ? OR recipes.preparation LIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").references(:ingredients)
  end
end
