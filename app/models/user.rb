class User < ActiveRecord::Base
  # Associations
  has_many :cookbooks
  has_many :ingredients
  has_many :recipes

  # Validations
end
