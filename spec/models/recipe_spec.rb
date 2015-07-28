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
    pending "name validation"
    pending "steps validation"
    pending "description validation"
    pending "avatar/image"
    pending "user_id validations"
  end
end
