require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it "creates valid recipes" do
      create :recipe

      expect(Recipe.count).to eq(1)
    end

    it "doesn't create invalid recipes" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end
  end # validations

  describe "associations" do
    it "belongs to a user" do
      user = create :user, id: 1
      create :recipe, user_id: 1

      expect(user.recipes.count).to eq(1)
    end

  end # associations
end # class Recipe
