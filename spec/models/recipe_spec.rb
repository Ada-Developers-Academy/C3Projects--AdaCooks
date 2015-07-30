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

    it "requires ingredients" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:req_ingredients)
    end
  end

  describe "scope" do
    let(:recipe2) {create :recipe}
    let(:recipe1) {create :recipe, name: "Fish Fingers"}
    let(:recipe3) {create :recipe, name: "Fry Fingers"}

    it "sorts all the recipes by alphabetical order" do
      recipe3
      correct_order = [recipe2, recipe1, recipe3]
      expect(Recipe.all.sort_by {|i| i.name}).to eq(correct_order)
    end
  end

end
