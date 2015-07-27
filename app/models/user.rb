class User < ActiveRecord::Base
# ASSOCIATIONS --------------------------------------
has_secure_password
has_many :cookbooks
has_many :recipes

end
