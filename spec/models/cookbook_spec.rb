require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "requires a name" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

    it "must be associated with a user" do
      cookbook = build :cookbook, user_id: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:user_id)
    end
  end

  describe "methods" do
    before :each do
      @cookbook = create :cookbook
      ingredient = create :ingredient
      recipe1 = create :recipe
      recipe2 = create :recipe, name: "Another Recipe "
      @cookbook.recipes << [ recipe1, recipe2 ]
    end

    it "#ingredient_count returns the number of unique ingredients" do
      expect(@cookbook.ingredient_count).to eq 1
    end

    it "#recipe_count returns the number of recipes" do
      expect(@cookbook.recipe_count).to eq 2
    end
  end
end
