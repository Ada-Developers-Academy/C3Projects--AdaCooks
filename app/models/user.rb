class User < ActiveRecord::Base
  has_secure_password

  has_many :cookbooks
  has_many :recipes, through: :cookbooks

# Validations _________________________________________________________________
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /@/
end
