class User < ActiveRecord::Base
  has_many :cookbooks
  has_secure_password

  validates :username, presence: true


end
