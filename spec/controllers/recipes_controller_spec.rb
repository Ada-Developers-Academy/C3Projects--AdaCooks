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

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "POST #create" do
    context "valid params" do

      let(:valid_params) do
        {name: "gnarly fake banana", preparation: "Don't make it, you monster.", user_id: 1}
      end

      it "creates a new recipes" do
        post :create, :recipe => valid_params
        expect(Recipe.count).to eq 1
      end
    end
  end
end
