require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "Requires that a cookbook name be present" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

     it "Requires that a cookbook name be present" do
      cookbook = build :cookbook

      expect(cookbook).to be_valid
     end
  end

  describe "#unassociate_recipes" do
    it "removes cookbook_id from recipes" do
      cookbook = create :cookbook
      recipe = create :recipe, cookbook_id: 1
      cookbook.unassociate_recipes
      recipe.reload

      expect(recipe.cookbook_id).to eq(nil)
    end
  end
end
