class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_and_belongs_to_many :ingredients
  belongs_to :cookbooks
  belongs_to :user

# VALIDATIONS -----------------------------------------
  validates :name, presence: true
  validates :prep, presence: true
  validate :req_ingredients

  def req_ingredients
    unless ingredients.length > 0
      errors.add(:ingredients, "Need at least one ingrediet in your recipe")
    end
  end
# SCOPES ----------------------------------------------

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

# METHODS ---------------------------------------------

  def self.organize
    self.all.sort_by { |i| i.name.capitalize }
  end

end
