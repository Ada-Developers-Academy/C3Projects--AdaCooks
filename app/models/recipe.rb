class Recipe < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_and_belongs_to_many :cookbooks, :join_table => "cookbooks_recipes"
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
  validates :preparation, presence: true
  # is this the best way to test associations??
  validates :user_id, presence: true

  # Scopes ----------------------------------------------------------------
  # refactor: have :newest chain from :desc_by_update
  scope :newest, -> (total) { order("created_at DESC").limit(total) }
  scope :desc_by_update, -> { order("updated_at DESC") }
end
