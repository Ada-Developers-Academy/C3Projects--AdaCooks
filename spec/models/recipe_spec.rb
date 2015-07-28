require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    it "Requires that a recipe name be present" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "Requires that a recipe preparation be present" do
      recipe = build :recipe, preparation: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:preparation)
    end

    it "Requires that a recipe has at least one ingredient" do
      recipe = build :recipe

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include (:ingredient)
    end
  end
end
