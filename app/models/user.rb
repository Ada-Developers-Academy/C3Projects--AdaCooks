class User < ActiveRecord::Base
  # enable bcrypt password_digest
  has_secure_password

  # Associations ---------------------------------------------------------------
  has_many :recipes
  has_many :cookbooks
  has_many :ingredients

  # Validations ----------------------------------------------------------------
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

end
