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
    # positive test - includes unique formats

    it "has all the unique formats in alphabetical order" do
    # We attempted to use Factory Girl, but it wouldn't generate even though we had all the needed attributes for recipe.  

    ingredient = Ingredient.create(id: 1, name: "Sumthin")
    recipe1 = Recipe.create(name: 'Goulash', ingredient_ids: 1, user_id: 1, preparation: "Stil")
    recipe2 = Recipe.create(name: 'Pho', ingredient_ids: 1, user_id: 1, preparation: "Stil")
    recipe3 = Recipe.create(name: 'BBQ Chikun', ingredient_ids: 1, user_id: 1, preparation: "Stil")
    recipe4 = Recipe.create(name: 'Armadillo', ingredient_ids: 1, user_id: 1, preparation: "Stil")
    correct_order = [recipe4, recipe3, recipe1, recipe2]
      expect(Recipe.alphabet).to eq correct_order
    end

  end
end
