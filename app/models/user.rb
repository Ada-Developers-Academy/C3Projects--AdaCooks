class User < ActiveRecord::Base
  before_save { email.downcase! }

  # ASSOCIATIONS --------------------------------------
  has_secure_password
  has_many :cookbooks
  has_many :recipes

  # VALIDATIONS ---------------------------------------
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,      presence: true
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 6 }

end
