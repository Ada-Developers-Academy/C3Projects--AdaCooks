require 'rails_helper'

RSpec.describe IngredientsHelper, type: :helper do
  let(:ingredient) { create :ingredient }
  let(:recipe1) { create :recipe }
  let(:recipe2) { create :recipe }
  let(:recipe3) { create :recipe }

  describe "ingredient_recipes_count" do
    it "outputs some text based on how many recipes an ingredient is used in" do
      recipe1.ingredients << ingredient
      recipe2.ingredients << ingredient
      expect(ingredient_recipes_count(ingredient)).to include("2")

      recipe3
      expect(ingredient_recipes_count(ingredient)).not_to include("3")
    end

    it "adjusts the pluralization if there's only one ingredient" do
      recipe1.ingredients << ingredient
      expect(ingredient_recipes_count(ingredient)).not_to include("s")

      recipe2.ingredients << ingredient
      expect(ingredient_recipes_count(ingredient)).to include("s")
    end
  end

  describe "random_ingredient_name" do
    it "selects a random ingredient's name" do
      ingredient
      expect(random_ingredient_name).to eq(ingredient.name)
    end
  end
end
