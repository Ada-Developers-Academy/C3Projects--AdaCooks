class Ingredient < ActiveRecord::Base
# ASSOCIATIONS -------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :cookbooks

# VALIDATIONS --------------------------------------
  validates :name, presence: true, uniqueness: true

# SCOPES -------------------------------------------
  scope :alphabetical, -> { sort_by {|i| i.name} }

# MOUNTED OBJECTS ----------------------------------
  # mount_uploader :image, ImageUploader

# METHODS ------------------------------------------

  # results in "stack level too deep" error for specs and regular use
  # def name=(name)
    # self.name = Ingredient.where(name: name).first_or_create
  # end

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
