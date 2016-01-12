class Cookbook < ActiveRecord::Base
  # Associations ---------------------------------------------
  belongs_to :user
  has_and_belongs_to_many :recipes, :join_table => "cookbooks_recipes" 
  has_many :ingredients, through: :recipes

  # Validations ----------------------------------------------
  validates :name, presence: true, uniqueness: true     

end
