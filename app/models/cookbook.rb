class Cookbook < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
  has_many :ingredients, -> { uniq }, through: :recipes # TODO: add test for uniq

  # VALIDATIONS ----------------------------------------------------------------
  validates :name, presence: true

  # SCOPES ---------------------------------------------------------------------
  scope :by_user, -> (logged_in) { where(user_id: logged_in) }

  def owner?(session_id) # TODO: test this
    user_id == session_id
  end
end
