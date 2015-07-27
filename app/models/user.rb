class User < ActiveRecord::Base
  #Associations
  has_secure_password
end
