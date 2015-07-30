class IngredietValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value > 0
      recipe.errors[:ingredients] << "You need at least one ingredient in your recipe"
    end
  end
end

class Recipe < ActiveRecord::Base
# ASSOCIATIONS ----------------------------------------
  has_and_belongs_to_many :ingredients
  belongs_to :cookbooks
  belongs_to :user

# VALIDATIONS -----------------------------------------
  validates :name, presence: true
  validates :prep, presence: true
  # validates :ingredient

  def req_ingredients(recipe)
    unless recipe.ingredients.length > 0
      recipe.errors[:ingredients] << "You need at least one ingrediet in your recipe"
    end
  end
# SCOPES ----------------------------------------------
  scope :alphabetical, -> { all.sort_by {|i| i.name} }

# MOUNT UPLOADER --------------------------------------
  mount_uploader :image, ImageUploader

end
