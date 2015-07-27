class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user
end
