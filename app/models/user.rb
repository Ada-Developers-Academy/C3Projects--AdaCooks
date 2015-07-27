class User < ActiveRecord::Base
	has_secure_password # what does this do again…?

# Associations -----------------------------------------------------------------
	has_many :cookbooks

# Validations ------------------------------------------------------------------
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true
end
