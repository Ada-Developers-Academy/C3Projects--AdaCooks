class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :recipes
  has_many :cookbooks
  has_many :ingredients

  accepts_nested_attributes_for :cookbooks
  accepts_nested_attributes_for :ingredients
  #Validations
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
