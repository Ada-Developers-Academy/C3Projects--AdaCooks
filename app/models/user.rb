class User < ActiveRecord::Base
  has_secure_password
  has_many :cookbooks
  has_many :recipes
  has_many :ingredients

  # VALIDATIONS ----------------------------------------------------------------
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true

  # so the URL displays the username vs the id
  def to_param
    username
  end
end
