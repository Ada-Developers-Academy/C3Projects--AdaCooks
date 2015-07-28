require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it "requires that a name be present" do
      recipe = build :recipe, name: nil
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :name
    end

    it "requires that a name be unique" do
      recipe = create :recipe
      recipe2 = build :recipe
      expect(recipe2).to_not be_valid
      expect(recipe2.errors.keys).to include :name
    end

    it "allows a recipe with a unique name" do
      recipe = create :recipe
      recipe2 = build :recipe, name: "sweet cream ice cream"
      expect(recipe2.errors.keys).to_not include :name
    end
  end
end
