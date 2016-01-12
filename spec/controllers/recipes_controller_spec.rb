require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    before :each do
      session[:user_id] = 1
      ingredient = create :ingredient
    end
    let(:recipe_params) {{ :recipe => {name: "chiken in a biscuit", prep: "open the box", ingredient_ids: ["1"], user_id: 1}}}
    let(:invalid_params) {{ :recipe => {name: nil, prep: nil, ingredient_ids: ["1"], user_id: 1}}}

    context "Valid recipe params" do
      it "creates a recipe" do
        post :create, recipe_params
        expect(Recipe.count).to eq(1)
      end

      it "redirects to the recipes index page after saving" do
        post :create, recipe_params
        expect(response).to redirect_to(recipes_path)
      end
    end

    context "Invalid recipe params" do
      it "does not persist invalid recipes" do
        post :create, invalid_params
        expect(Recipe.count).to eq(0)
      end

      it "renders the 'new' recipe form view to fix invalid fields" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      session[:user_id] = 1
      ingredient = create :ingredient
    end
    let(:recipe_params) {{ :recipe => {name: "chiken in a biscuit", prep: "open the box", ingredient_ids: ["1"], user_id: 1}}}

    context "valid updates to recipe" do
      it "redirects to the recipe index after updating" do
        patch :update, recipe_params
        expect(response).to be_success
        expect(response).to redirect_to(recipes_path)
      end
    end
  end
end
