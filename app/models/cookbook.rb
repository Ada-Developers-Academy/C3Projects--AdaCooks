class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes
end
