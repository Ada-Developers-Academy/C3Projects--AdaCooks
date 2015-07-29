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
      # before :each do
        # @recipe = create :recipe
        # session[:user_id] = 1
      # end

      let(:recipe) { create :recipe}

      it "creates a recipe" do
        binding.pry
        post :create, recipe.attributes
        expect(Recipe.count).to eq(1)
      end

      it "redirects to the recipes index page after saving" do
        post :create, recipe: recipe.attributes, session: { user_id: 1 }
        # binding.pry
        expect(response).to redirect_to(recipes_path)
      end
    end

    context "Invalid recipe params" do
      let(:recipe) {build :recipe, name: nil}

      it "does not persist invalid recipes" do
        post :create, recipe.attributes
        expect(Recipe.count).to eq(0)
      end

      it "re-renders the 'new' recipe form view" do
        post :create, recipe.attributes
        expect(response).to redirect_to(new_recipe_path)
      end
    end
  end
end
