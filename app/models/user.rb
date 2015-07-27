class User < ActiveRecord::Base
  has_secure_password

  has_many :recipes
  has_many :cookbooks
end
