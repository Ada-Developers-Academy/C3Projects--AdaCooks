class Ingredient < ActiveRecord::Base
# ASSOCIATIONS -------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :cookbooks

# VALIDATIONS --------------------------------------
  validates :name, presence: true, uniqueness: true

# SCOPES -------------------------------------------
  scope :alphabetical, -> { sort_by {|i| i.name} }

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
