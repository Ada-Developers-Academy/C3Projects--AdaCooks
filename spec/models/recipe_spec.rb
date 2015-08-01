require 'rails_helper'

RSpec.describe Recipe, type: :model do
    describe "model validations" do
    it "requires a name" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires instructions" do
      recipe = build :recipe, instructions: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:instructions)
    end

    it "creates a new instance" do
      recipe = build :recipe

      expect(recipe).to be_valid
      expect(recipe.errors.keys).to_not include(:name)
    end
  end
end
