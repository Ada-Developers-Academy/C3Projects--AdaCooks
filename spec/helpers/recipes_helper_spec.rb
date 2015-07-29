require 'rails_helper'

RSpec.describe RecipesHelper, type: :helper do
  let(:recipe) { create :recipe }
  let(:ingredient1) { create :ingredient, name: "one" }
  let(:ingredient2) { create :ingredient, name: "two" }
  let(:ingredient3) { create :ingredient, name: "three" }

  describe "recipe_ingredients_count" do
    it "outputs some text based on the number of ingredients for a recipe" do
      recipe.ingredients << ingredient1
      recipe.ingredients << ingredient2
      expect(recipe_ingredients_count(recipe)).to include("2")

      ingredient3
      expect(recipe_ingredients_count(recipe)).not_to include("3")
    end

    it "adjusts the pluralization if there's only one ingredient" do
      recipe.ingredients << ingredient1
      expect(recipe_ingredients_count(recipe)).not_to include("s")

      recipe.ingredients << ingredient2
      expect(recipe_ingredients_count(recipe)).to include("s")
    end
  end

  describe "random_recipe_name" do
    it "selects a random recipe's name" do
      recipe
      expect(random_recipe_name).to eq(recipe.name)
    end
  end
end
