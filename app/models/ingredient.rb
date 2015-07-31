class Ingredient < ActiveRecord::Base
# ASSOCIATIONS -------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :cookbooks

# VALIDATIONS --------------------------------------
  validates :name, presence: true, uniqueness: true

# SCOPES -------------------------------------------
  scope :alpha, -> { order("name ASC") }

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

# METHODS ------------------------------------------

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

end
