class Ingredient < ActiveRecord::Base

# Associations______________________________________________________________
  has_and_belongs_to_many :recipes

# Validations __________________________________________________________
  validates :name, presence: true, uniqueness: true

# Mounted Objects------------------------------------------------------------
  mount_uploader :image, ImageUploader

# Scopes _______________________________________________________________
  scope :alpha_order, -> { order('name ASC') }
  scope :search, ->(search) { where("name like ?", "%#{search}%")}
end
