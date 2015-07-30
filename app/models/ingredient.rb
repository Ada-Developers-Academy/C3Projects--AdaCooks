class Ingredient < ActiveRecord::Base
# ASSOCIATIONS -------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :cookbooks

# VALIDATIONS --------------------------------------
  validates :name, presence: true, uniqueness: true

# SCOPES -------------------------------------------

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

# METHODS ------------------------------------------

  def self.organize
    self.all.sort_by { |i| i.name.capitalize }
  end

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

end
