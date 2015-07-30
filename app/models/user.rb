class User < ActiveRecord::Base
# Associations --------------------------------------------------
  has_secure_password
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

# Validations ---------------------------------------------------
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
end
