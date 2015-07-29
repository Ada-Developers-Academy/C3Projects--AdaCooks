class Recipe < ActiveRecord::Base
  # Associations ----------------------------------
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user
end
