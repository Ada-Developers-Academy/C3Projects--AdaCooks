class Cookbook < ActiveRecord::Base

# associations ________________________________________________________________
  belongs_to :user
  has_many :recipes
  has_many :ingredients, -> { uniq }, through: :recipes

# Validations ________________________________________________________________
  validates :name, presence: true

# Mounted Objects------------------------------------------------------------
  mount_uploader :image, ImageUploader


# Scopes _____________________________________________________________________

scope :user_cookbooks, -> (user) { where(user_id: "#{user.id}") }

end
