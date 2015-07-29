class Recipe < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_and_belongs_to_many :cookbooks
  has_many :ingredients, through: :recipe_ingredients

  ## look up dependent destroy Active Record ramifications

  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
  validates :preparation, presence: true
  # is this the best way to test associations??
  validates :user_id, presence: true
end
