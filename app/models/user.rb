class User < ActiveRecord::Base
  has_secure_password

  has_many :recipes
  has_many :cookbooks

  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

end
