require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all recipes into @recipes" do
      recipe1 = create :recipe, name: "tacos"
      recipe2 = create :recipe, name: "pizza"
      get :index
      expect(assigns(:recipes)).to match_array([recipe1, recipe2])
    end
  end

  describe "GET #show" do
    before(:each) do
      @recipe = create :recipe, name: "taiyaki"
    end

    it "renders the show template" do
      get :show, id: @recipe
      expect(response).to render_template :show
    end

    it "displays the correct recipe" do
      get :show, :id => 1
      expect(assigns(:recipe)).to eq(@recipe)
    end

  end
end
