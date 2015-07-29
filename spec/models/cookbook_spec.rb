require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "database relationships" do
    it "belongs to a user" do
      user = create :user
      cookbook = create :cookbook, user_id: user.id

      expect(cookbook.user).to eq(user)
    end

    it "has and belongs to many recipes" do
      cookbook = create :cookbook
      recipe1 = create :recipe
      recipe2 = create :recipe
      recipe3 = create :recipe

      all_recipes = [recipe1, recipe2, recipe3]

      all_recipes.each do |recipe|
        cookbook.recipes << recipe
      end

      expect(cookbook.recipes).to eq(all_recipes)
    end

    it "has many ingredients" do
      cookbook = create :cookbook

      recipe = create :recipe

      ingredient1 = create :ingredient
      ingredient2 = create :ingredient

      all_ingredients = [ingredient1, ingredient2]

      recipe.ingredients << ingredient1
      recipe.ingredients << ingredient2
      cookbook.recipes << recipe

      expect(recipe.ingredients).to eq(all_ingredients)
    end
  end

  describe "model validations" do
    it "requires a name" do
      cookbook = create :cookbook, name: "yes"

      expect(cookbook).to be_valid
      expect(Cookbook.count).to eq(1)
    end

    it "does not create a recipe without a name" do
      invalid_cookbook = build :cookbook, name: nil

      expect(invalid_cookbook).not_to be_valid
      expect(invalid_cookbook.errors.keys).to include(:name)
    end

    it "requires a user_id" do
      cookbook = create :cookbook, user_id: 1

      expect(cookbook).to be_valid
      expect(Cookbook.count).to eq(1)
    end

    it "does not create a recipe without a user_id" do
      invalid_cookbook = build :cookbook, user_id: nil

      expect(invalid_cookbook).not_to be_valid
      expect(invalid_cookbook.errors.keys).to include(:user_id)
    end

    it "requires an integer for user_id" do
      invalid_cookbook = build :cookbook, user_id: "no"

      expect(invalid_cookbook).not_to be_valid
      expect(invalid_cookbook.errors.keys).to include(:user_id)
    end

    pending "avatar/image"
  end
end
