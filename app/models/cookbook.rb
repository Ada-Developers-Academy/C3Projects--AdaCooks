class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_many :recipes
  has_many :ingredients, through: :recipes

# ----------VALIDATIONS------------------------------
  validates :name, presence: true, uniqueness: true

  def self.alphabetize
    order('name')
  end
end
