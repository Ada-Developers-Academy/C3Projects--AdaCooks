class Ingredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :recipes

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true, length: { maximum: 25 }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Scopes ---------------------------------------------------------------------
  scope :alphabetized, -> { order("name ASC") }

  # Mounted Objects ------------------------------------------------------------
  mount_uploader :avatar, AvatarUploader

  # Instance Methods -----------------------------------------------------------
  def proper_name
    name.titlecase
  end

  # Class Methods --------------------------------------------------------------
  def self.trending
    ingredients = self.all

    trending_ingredients = ingredients.sort_by do |ingredient|
      ingredient.recipes.count
    end

    # return in reverse b/c above sorts ascending
    return trending_ingredients.last(5).reverse
  end
end
