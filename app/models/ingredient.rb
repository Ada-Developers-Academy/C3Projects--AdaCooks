class Ingredient < ActiveRecord::Base
# ASSOCIATIONS -------------------------------------
  belongs_to :recipe
  belongs_to :cookbook

# VALIDATIONS --------------------------------------
  validates :name, presence: true, uniqueness: true

# SCOPES -------------------------------------------
  scope

end
