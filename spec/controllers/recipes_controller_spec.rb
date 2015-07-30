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

    context "Valid recipe params" do
      let(:recipe) { create :recipe }

      it "creates a recipe" do
        post :create, recipe.attributes
        expect(Recipe.count).to eq(1)
      end

      it "redirects to the recipes index page after saving" do
        session[:user_id] = 1
        post :create, recipe.attributes
        expect(response).to have_http_status(302)
      end
    end

    context "Invalid recipe params" do
      let(:recipe) {build :recipe, name: nil}

      it "does not persist invalid recipes" do
        post :create, recipe.attributes
        expect(Recipe.count).to eq(0)
      end

      # it "renders the 'new' recipe form view to fix invalid fields" do
        # post :create, recipe.attributes
        # expect(response).to render_template("new")
      # end
    end
  end

  describe "PATCH #update" do
    let(:recipe) {create :recipe}

    context "valid updates to recipe" do
      # it "responds successfully with an HTTP 300 status code" do
        # patch :update, id: recipe.id
        # expect(response).to be_success
        # expect(response).to have_http_status(300)
      # end
    end
  end
end
