require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "database relationships" do
    it "belongs to a user" do
      user1 = create :user
      user2 = create :user
      ingredient = create :ingredient, user_id: user1.id

      expect(ingredient.user).to eq(user1)
      expect(ingredient.user).not_to eq(user2)
    end

    it "has and belongs to many recipes" do
      ingredient = create :ingredient
      recipe1 = create :recipe
      recipe2 = create :recipe
      recipe3 = create :recipe

      recipe1.ingredients << ingredient
      recipe2.ingredients << ingredient

      expect(ingredient.recipes).to include(recipe1)
      expect(ingredient.recipes).not_to include(recipe3)
      expect(ingredient.recipes.count).to eq(2)
      expect(Recipe.all.count).to eq(3)
    end
  end

  describe "model validations" do
    context "name" do
      it "requires a name to be valid" do
        valid_ingredient = build :ingredient, name: "potato potato potato"
        expect(valid_ingredient).to be_valid
        expect(valid_ingredient.errors.keys).not_to include(:name)

        invalid_ingredient = build :ingredient, name: nil
        expect(invalid_ingredient).not_to be_valid
        expect(invalid_ingredient.errors.keys).to include(:name)
      end
    end

    context "user_id" do
      it "requires a user_id to be valid" do
        valid_ingredient = build :ingredient, user_id: "1"
        expect(valid_ingredient).to be_valid
        expect(valid_ingredient.errors.keys).not_to include(:user_id)

        invalid_ingredient = build :ingredient, user_id: nil
        expect(invalid_ingredient).not_to be_valid
        expect(invalid_ingredient.errors.keys).to include(:user_id)
      end

      it "must be an integer value greater than zero" do
        valid_user_ids = ["1", "25", "1000"]
        valid_user_ids.each do |user_id|
          ingredient = build :ingredient, user_id: user_id
          expect(ingredient).to be_valid
          expect(ingredient.errors.keys).not_to include(:user_id)
        end

        invalid_user_ids = ["0.25", "-40", "three", { user_id: "1" }]
        invalid_user_ids.each do |user_id|
          ingredient = build :ingredient, user_id: user_id
          expect(ingredient).not_to be_valid
          expect(ingredient.errors.keys).to include(:user_id)
        end
      end
    end

    pending "avatar validations"
  end

  describe "scopes" do
    it "can grab ingredients in :alphabetized order" do
      ingredient1 = create :ingredient, name: "apple"
      ingredient2 = create :ingredient, name: "coffee"
      ingredient3 = create :ingredient, name: "broccoli"
      ingredient4 = create :ingredient, name: "banana"
      ingredient5 = create :ingredient, name: "aardvark"
      correct_order = [ingredient5, ingredient1, ingredient4, ingredient3, ingredient2]

      expect(Ingredient.alphabetized).to eq(correct_order)
      # OPTIMIZE: is the following line the best way to check this?
      expect(Ingredient.alphabetized.map { |ing| ing.id }).not_to eq(["1", "2", "3", "4", "5"])
    end
  end
end
