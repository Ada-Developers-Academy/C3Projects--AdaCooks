require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    let(:recipe2) { create :recipe, name: "Cream" }

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all recipes into @recipes" do
      recipe = build :recipe
      all_recipes = [recipe, recipe2]
      get :index
      expect(all_recipes.count).to eq 2
    end

  end

end
