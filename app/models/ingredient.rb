class Ingredient < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  belongs_to :user

  # Mounted Objects -------------------------------------------------------------
  mount_uploader :image, ImageUploader

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true

  # Scopes ----------------------------------------------------------------
  scope :newest, -> (total) { order("created_at DESC").limit(total) }
  scope :alpha, -> { order("name ASC") }

  def self.search(query)
    results = where("name like ?", "%#{query}%")
    results.take.recipes if results.length > 0
  end
end
