class Recipe < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # Associations
  belongs_to :user
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients

  # Validations
  validates :name, presence: true
  validates :preparation, presence: true
  validate :ingredient_was_checked

  # Mounted object
  mount_uploader :image, ImageUploader

  private

  def ingredient_was_checked
    if self.ingredient_ids.blank?
      self.errors.add(:ingredient_ids, "You must select at least one ingredient.")
    end
  end

  # look up join table validations when we get a sec
  # validates :ingredients, presence: true, uniqueness: true
  # Elsa's answer: probably custom validations on create
end
