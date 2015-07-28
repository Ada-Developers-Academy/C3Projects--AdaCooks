class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  has_many :ingredients, through: :recipes

  validates :name, presence: true, uniqueness: true
end
