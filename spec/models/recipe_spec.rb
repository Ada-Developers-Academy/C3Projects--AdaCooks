require 'rails_helper'

RSpec.describe Recipe, type: :model do


  describe "class methods" do
    let(:recipe_a) { create(:recipe, name: "a") }
    let(:recipe_b) { create(:recipe, name: "b") }
    let(:recipe_c) { create(:recipe, name: "c") }

    describe ".by_name" do
      it "returns all recipes in alphabetical order" do
        recipe_b # need to create the records in the db out of alphabetical order
        recipe_order = [ recipe_a, recipe_b, recipe_c ]

        expect(Recipe.by_name).to eq(recipe_order)
      end
    end

    describe ".search_by_ingredient" do
      let(:search_query) { "carrots" }
      before :each do
        carrots = create(:ingredient, name: "Chopped #{search_query}")

        # the order of the following is important --
        # the db records need to be created out of alphabetical order
        create(:measurement, ingredient: carrots, recipe: recipe_b)
        create(:measurement, ingredient: carrots, recipe: recipe_a)
      end

      it "only returns recipes that contain the ingredient" do
        excluded_recipe = recipe_c

        expect(Recipe.search_by_ingredient(search_query)).to include(recipe_a, recipe_b)
        expect(Recipe.search_by_ingredient(search_query)).not_to include(excluded_recipe)
      end
    end
  end
end
