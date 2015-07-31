class Recipe < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :ingredients
    # accepts_nested_attributes_for :ingredients # FIXME: test accepts_nested_attributes_for :ingredients
  has_and_belongs_to_many :cookbooks

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, length: { maximum: 25 }
  validates :steps, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Scopes ---------------------------------------------------------------------
  scope :alphabetized, -> { order(:name) }

  # Mounted Objects ------------------------------------------------------------
  mount_uploader :avatar, AvatarUploader

  # Instance Methods -----------------------------------------------------------
  def remove_ingredient_association(ingredient_id)
    ingredient = Ingredient.find(ingredient_id)
    ingredients.delete(ingredient)
  end

  def add_ingredient_association(ingredient)
    ingredients << ingredient unless ingredients.include? ingredient
  end

  def proper_name # FIXME: test Recipe#proper_name
    name.titlecase # OPTIMZE: also should Recipe#proper_name be a helper?
  end
end
