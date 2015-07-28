class User < ActiveRecord::Base
	has_secure_password # enables use of bcrypt

# Associations -----------------------------------------------------------------
	has_many :cookbooks

# Validations ------------------------------------------------------------------
	validates :username, :email,                 presence: true, uniqueness: true
	validates :password, :password_confirmation, presence: true
end
