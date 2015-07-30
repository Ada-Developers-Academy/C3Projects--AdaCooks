require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #new" do
    before :each do
      recipe = create :recipe
      get :show, id: recipe.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end

  describe "POST #create" do
    context "valid recipe params" do
      it "creates a new recipe" do
        recipe = build :recipe
        post :create, recipe: attributes_for(:recipe)
      
        expect(Recipe.count).to eq 1
      end
    end

    context "invalid recipe params" do

    end
  end
end
