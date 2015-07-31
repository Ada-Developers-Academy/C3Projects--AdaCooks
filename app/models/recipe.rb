class Recipe < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :cookbooks
  belongs_to :user

  #Validations-------------------------------------------------------------------
  validates :name, presence: true
  validates :instructions, presence: true

  #Scopes------------------------------------------------------------------------
  #Mounted Objects---------------------------------------------------------------
  mount_uploader :image, ImageUploader

  #Search Logic-----------------------------------------------------------------

  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    result = where("name = ?", "#{query}")

    return result.count > 0 
  end

end

