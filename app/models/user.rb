class User < ActiveRecord::Base
  # Associations
  has_many :cookbooks
  has_many :ingredients
  has_many :recipes

  # Validations
  VALID_EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, with: VALID_EMAIL_REGEX
  validates :password, presence: true, confirmation: true

end
