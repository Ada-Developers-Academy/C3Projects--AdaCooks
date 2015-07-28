require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe "model validations" do
    it "will not save without a name" do

      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      ingredient =     create :ingredient, name: "yams"
      ingredientsame = build :ingredient, name: "yams"

      expect(ingredientsame).to_not be_valid
      expect(ingredientsame.errors.keys).to include(:name)
    end
  end

  describe "model associations" do
    it "belongs to user 1" do
      ingredient = create :ingredient

      expect(ingredient.user_id).to eq 1
    end

    it "has and belongs to recipes" do
      ingredient = create :ingredient
      recipe = create :recipe
      ingredient.recipes << recipe

      expect(ingredient.recipes.count).to eq 1
      expect(recipe.ingredients.count).to eq 1
    end
  end
end
