require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "database relationships" do
    it "belongs to a user" do
      user = create :user
      recipe = create :recipe, user_id: user.id

      expect(recipe.user).to eq(user)
    end

    it "has and belongs to many ingredients" do
      recipe = create :recipe
      ingredient1 = create :ingredient
      ingredient2 = create :ingredient
      ingredient3 = create :ingredient

      all_ingredients = [ingredient1, ingredient2, ingredient3]

      all_ingredients.each do |ingredient|
        recipe.ingredients << ingredient
      end

      expect(recipe.ingredients).to eq(all_ingredients)
    end

    it "has and belongs to many cookbooks" do
      recipe = create :recipe

      cookbook1 = create :cookbook
      cookbook2 = create :cookbook

      all_cookbooks = [cookbook1, cookbook2]

      all_cookbooks.each do |cookbook|
        recipe.cookbooks << cookbook
      end

      expect(recipe.cookbooks).to eq(all_cookbooks)
    end
  end

  describe "model validations" do
    it "requires a name" do
      recipe = create :recipe, name: "yes"

      expect(recipe).to be_valid
      expect(Recipe.count).to eq(1)
    end

    it "does not create a recipe without a name" do
      invalid_recipe = build :recipe, name: nil

      expect(invalid_recipe).not_to be_valid
      expect(invalid_recipe.errors.keys).to include(:name)
    end

    it "requires steps" do
      recipe = create :recipe, steps: "some steps"

      expect(recipe).to be_valid
      expect(Recipe.count).to eq(1)
    end

    it "does not create a recipe without steps" do
      invalid_recipe = build :recipe, steps: nil

      expect(invalid_recipe).not_to be_valid
      expect(invalid_recipe.errors.keys).to include(:steps)
    end

    it "requires a user_id" do
      recipe = create :recipe, user_id: 1

      expect(recipe).to be_valid
      expect(Recipe.count).to eq(1)
    end

    it "does not create a recipe without a user_id" do
      invalid_recipe = build :recipe, user_id: nil

      expect(invalid_recipe).not_to be_valid
      expect(invalid_recipe.errors.keys).to include(:user_id)
    end

    it "requires an integer for user_id" do
      invalid_recipe = build :recipe, user_id: "no"

      expect(invalid_recipe).not_to be_valid
      expect(invalid_recipe.errors.keys).to include(:user_id)
    end

    pending "avatar/image"
  end

  describe "model scopes" do
    it ".alphabetized puts recipes in alphabetical order" do
      recipe3 = create :recipe, name: "c"
      recipe1 = create :recipe, name: "a"
      recipe2 = create :recipe, name: "b"

      sorted_recipes = [recipe1, recipe2, recipe3]

      expect(Recipe.alphabetized).to eq(sorted_recipes)
    end
  end
end
