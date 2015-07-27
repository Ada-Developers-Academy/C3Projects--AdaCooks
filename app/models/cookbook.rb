class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, through: :recipes
end
