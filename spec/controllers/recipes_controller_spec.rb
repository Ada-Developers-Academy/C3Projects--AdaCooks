require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:all_recipes) { Recipe.all }

  describe "get :index" do
    before :each do
      5.times { create(:recipe) }
    end

    it "assigns @recipes" do
      get :index

      expect(assigns(:recipes).count).to eq(5)
      expect(assigns(:recipes)).to eq(all_recipes)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end
  end
end
