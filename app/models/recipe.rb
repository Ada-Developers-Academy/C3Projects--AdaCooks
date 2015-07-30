class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_and_belongs_to_many :ingredients
  belongs_to :cookbooks
  belongs_to :user

  accepts_nested_attributes_for :ingredients
  # accepts_nested_attributes_for :cookbooks

# VALIDATIONS -----------------------------------------
  validates :name, presence: true
  validates :prep, presence: true
  validates_associated :ingredients

# SCOPES ----------------------------------------------
  scope :alphabetical, -> { all.sort_by {|i| i.name} }
  # scope :find_recipe, ->

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

end
