require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    let(:recipe) {build :recipe, name: nil, prep: nil}

    it "requires a name" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires preparation instructions" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:prep)
    end
  end
end
