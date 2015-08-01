class Ingredient < ActiveRecord::Base
    #Validations
    validates :name, uniqueness: true

    # Mounted Objects
    mount_uploader :image, ImageUploader

    #Associations
    has_and_belongs_to_many :recipes
    belongs_to :user

    def self.search(query)
      where("name like ?", "%#{query}%")
    end

end
