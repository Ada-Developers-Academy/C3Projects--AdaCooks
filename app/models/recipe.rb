class Recipe < ActiveRecord::Base
# Associations --------------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks

# Validations ---------------------------------------------------
  validates :name, presence: true
  validates :preparation, presence: true
  # one or more ingredients required, need to look up how to do this validation

# Scopes --------------------------------------------------------
  scope :alpha_order, -> { order(name: :asc) }
end
