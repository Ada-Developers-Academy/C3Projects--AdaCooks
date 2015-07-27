class User < ActiveRecord::Base
  has_many :cookbooks
  has_many :recipes
end
