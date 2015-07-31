class Recipe < ActiveRecord::Base
  # Validations
   validates :name, presence: true
   validates :ingredients, :length => { :minimum => 1 }
  # validates :preparation, presence: true
  # validates :ingredients, presence: true

  # Mounted Objects
  mount_uploader :image, ImageUploader

  # Associations
  has_and_belongs_to_many :cookbooks
  has_and_belongs_to_many :ingredients
  belongs_to :user

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

end
