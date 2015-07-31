require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "will not save without a name" do

      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

    it "will not save without a user_id" do

      cookbook = build :cookbook, user_id: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:user_id)
    end
  end

  describe "model associations" do
    it "belongs to user 1" do
      cookbook = create :cookbook

      expect(cookbook.user_id).to eq 1
    end

    it "has and belongs to recipes" do
      cookbook = create :cookbook
      recipe = create :recipe
      cookbook.recipes << recipe

      expect(cookbook.recipes.count).to eq 1
      expect(recipe.cookbooks.count).to eq 1
    end

    it "has ingredients through recipes" do
      cookbook = create :cookbook
      recipe = create :recipe
      cookbook.recipes << recipe

      expect(cookbook.ingredients.count).to eq 1
    end
  end
end
