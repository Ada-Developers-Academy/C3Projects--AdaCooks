class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, through: :recipes

  # VALIDATIONS ----------------------------------------------------------------
  validates :name, presence: true

  # SCOPES ---------------------------------------------------------------------
  scope :by_user, -> (logged_in) { where(user_id: logged_in) }
end
