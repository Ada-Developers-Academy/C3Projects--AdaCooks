class Ingredient < ActiveRecord::Base
# Associations --------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user

# Validations ---------------------------------------------------
  validates :name, presence: true, uniqueness: true
end
