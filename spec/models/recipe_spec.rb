require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "scopes" do
    describe ".by_name" do
      let(:recipe_a) { create(:recipe, name: "a") }
      let(:recipe_b) { create(:recipe, name: "b") }
      let(:recipe_c) { create(:recipe, name: "c") }

      it "returns all recipes in alphabetical order" do
        recipe_b # need to create the records in the db out of alphabetical order
        recipe_order = [ recipe_a, recipe_b, recipe_c ]

        expect(Recipe.by_name).to eq(recipe_order)
      end
    end
  end
end
