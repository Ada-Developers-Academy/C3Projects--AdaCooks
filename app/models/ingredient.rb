class Ingredient < ActiveRecord::Base

# associations______________________________________________________________
  has_and_belongs_to_many :recipies

# Validations __________________________________________________________
  validates :name, presence: true, uniqueness: true

# Scopes _______________________________________________________________
  scope :alpha_order, -> { order('name ASC') }
end
