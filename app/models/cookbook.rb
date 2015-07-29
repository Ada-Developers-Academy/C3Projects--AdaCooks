class Cookbook < ActiveRecord::Base
  # Associations ----------------------------------
  belongs_to :user
  has_and_belongs_to_many :recipes
end
