class User < ActiveRecord::Base
# Associations --------------------------------------------------
  has_secure_password
  has_many :cookbooks
  has_many :recipes

# Validations ---------------------------------------------------
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
