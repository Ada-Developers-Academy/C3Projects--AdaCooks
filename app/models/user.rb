class User < ActiveRecord::Base
  # Associations ----------------------------------
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

  has_secure_password

  validates :username, presence: true


end
