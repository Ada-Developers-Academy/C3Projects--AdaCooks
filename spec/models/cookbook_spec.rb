require 'rails_helper'

RSpec.describe Cookbook, type: :model do

  describe Cookbook do
    it_behaves_like "an object"
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
