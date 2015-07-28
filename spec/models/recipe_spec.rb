require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    it "Requires that a recipe name be present" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end
  end
end
