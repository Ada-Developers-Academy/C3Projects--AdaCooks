class User < ActiveRecord::Base
  has_secure_password
  
# Associations _________________________________________________________________
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients, through: :recipes

# Validations _________________________________________________________________
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /@/
end
