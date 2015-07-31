class Recipe < ActiveRecord::Base
  # uploader ------
  mount_uploader :image, ImageUploader
  # Associations ----------------------------------
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user

  # Validations ----------------------------------------------------------------
  validates :name, presence: true
  validates :preparation, presence: true
  validates_with RecipeValidator, :on => [:create, :update]

  # Scopes -----------------------------------------
  scope :alphabet, -> { order('lower (name)') }
  scope :diff, -> { select(:ingredients).distinct.order(:ingredients).pluck(:ingredients) }

  # Mounted Objects_____________________________________________________________
  # mount_uploader :image, ImageUploader #instance of class image uploader

  def self.search(query)
    Recipe.includes(:ingredients).where(ingredients: {name: "#{query}"} )
  end


end
