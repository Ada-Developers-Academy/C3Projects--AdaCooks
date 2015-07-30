require 'rails_helper'

RSpec.describe Recipe, type: :model do

  describe "recipe model validations" do
    it "must have one or more order ingredients" do
      recipe = build :recipe
      ingredient = build :ingredient
      recipe.ingredients << ingredient

      expect(recipe).to be_valid
    end

    it "Requires that a name must be present" do
      recipe2 = build :recipe, name: nil

      expect(recipe2).to_not be_valid
      expect(recipe2.errors.keys).to include(:name)
    end

    it "Requires that a preparation must be present" do
      recipe = build :recipe, preparation: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:preparation)
    end
  end

  describe "alphabet scope" do

    let(:recipe1) { create :recipe, name: 'BBQ Chikun' }
    let(:recipe2) { create :recipe, name: 'Goulash' }
    let(:recipe3) { create :recipe, name: 'Pho' }
    let(:recipe4) { create :recipe, name: 'Armadillo' }

    # positive test - includes unique formats
    it "has all the unique formats in alphabetical order" do
      recipe2
      correct_order = [recipe4, recipe1, recipe2, recipe3]
      expect(Recipe.all.alphabet).to eq correct_order
    end

  end
end
