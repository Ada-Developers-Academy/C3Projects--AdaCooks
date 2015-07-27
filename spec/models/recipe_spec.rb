require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    recipe = build :recipe, name: nil, prep: nil

    it "requires a name" do
      expect(recipe).to_not be_valid      
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires preparation instructions" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:prep)
    end
  end
  # validates :name, presence: true, uniqueness: true
  # validates :prep, presence: true
  # validates_associated :ingredients

end
