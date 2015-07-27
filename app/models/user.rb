class User < ActiveRecord::Base
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

  has_secure_password
end
