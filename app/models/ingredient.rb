class Ingredient < ActiveRecord::Base
  #Associations------------------------------------------------------------------
  has_and_belongs_to_many :recipes
  belongs_to :user
  #Validations-------------------------------------------------------------------
  validates :name, presence: true, uniqueness: true
 
  #Scopes------------------------------------------------------------------------
  #Mounted Objects---------------------------------------------------------------
  mount_uploader :image, ImageUploader

  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    result = where("name = ?", "#{query}")

    return result.count > 0 
  end

  def self.query(query)
    # where(:name, query) -> This would return an exact match of the query
    where("name = ?", "#{query}") 
  end


end


