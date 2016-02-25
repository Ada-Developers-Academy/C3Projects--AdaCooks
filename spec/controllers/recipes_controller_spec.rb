require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "get :index" do
    let(:recipe_a) { create(:recipe, name: "a") }
    let(:recipe_b) { create(:recipe, name: "b") }
    let(:recipe_c) { create(:recipe, name: "c") }

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    context "when not provided a search query" do
      it "assigns all recipes to @recipes" do
        5.times { create(:recipe) }

        get :index

        expect(assigns(:recipes).count).to eq(5)
      end

      it "assigns @recipes in alphabetical order" do
        recipe_b # need to create the records in the db out of alphabetical order
        recipe_order = [ recipe_a, recipe_b, recipe_c ]

        get :index

        expect(assigns(:recipes).count).to eq(3)
        expect(assigns(:recipes)).to eq(recipe_order)
      end
    end

    context "when provided an ingredient search query" do
      let(:search_query) { "carrots" }
      before :each do
        carrots = create(:ingredient, name: "Chopped #{search_query}")

        # the order of the following is important --
        # the db records need to be created out of alphabetical order
        create(:measurement, ingredient: carrots, recipe: recipe_b)
        create(:measurement, ingredient: carrots, recipe: recipe_a)
      end

      it "@recipes only incudes the recipes that contain the ingredient" do
        excluded_recipe = recipe_c

        get :index, { search: search_query }

        expect(assigns(:recipes)).to include(recipe_a, recipe_b)
        expect(assigns(:recipes)).not_to include(excluded_recipe)
      end

      it "assigns @recipes in alphabetical order" do
        get :index, { search: search_query }

        expect(assigns(:recipes)).to eq([recipe_a, recipe_b])
      end
    end
  end

  describe "get :show" do
    let(:recipe) { create(:recipe) }

    it "assigns @recipe" do
      get :show, { id: recipe.id }

      expect(assigns(:recipe)).to eq(recipe)
    end

    it "renders the show template" do
      get :show, { id: recipe.id }

      expect(response).to render_template("show")
    end
  end
end
