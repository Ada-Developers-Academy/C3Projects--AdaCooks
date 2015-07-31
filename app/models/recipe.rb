class Recipe < ActiveRecord::Base

# associations__________________________________________________________
  has_and_belongs_to_many :ingredients
  belongs_to :cookbook
  belongs_to :user

# Validations __________________________________________________________
  validates :name, presence: true
  validates :preparation, presence: true
  validates_with RecipeValidator, on: :update

# Mounted Objects------------------------------------------------------------
  mount_uploader :image, ImageUploader

# Scopes _______________________________________________________________
  scope :alpha_order, -> { order('name ASC') }


  def unassociate_ingredients
    self.ingredients = []
  end
end
