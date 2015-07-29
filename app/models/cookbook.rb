class Cookbook < ActiveRecord::Base
  # Associations ---------------------------------------------------------------
  has_and_belongs_to_many :recipes, :join_table => "cookbooks_recipes"
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true
  validates :user_id, presence: true

  # Scopes ---------------------------------------------------------------------
  scope :alphabetical, -> { order("name") }
end
