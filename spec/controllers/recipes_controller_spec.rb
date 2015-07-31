require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  before(:each) do
    @user = create :user
  end

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
      session[:user_id] = 1
      @recipe = create :recipe, name: "taiyaki"
    end

    it "renders the show template" do
      get :show, id: @recipe
      expect(response).to render_template :show
    end

    it "displays the correct recipe" do
      get :show, id: 1
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
      before(:each) do
        session[:user_id] = @user.id
        post :create, recipe: valid_params
      end

      it "creates a new recipe" do
        expect(Recipe.count).to eq 1
      end
    end

    describe "PATCH #update" do
      let(:new_params) do
        {preparation: "I tried to make this, and the chemicals melted my kitchen counter." }
      end

      before(:each) do
        @recipe = create :recipe, name: "gnarly fake banana"
        patch :update, id: 1, recipe: new_params
        @recipe.reload
      end

      it "updates a record with new preparation details" do
        expect(@recipe.preparation).to eq(new_params[:preparation])
      end

      it "redirects to the show page after updating a recipe" do
        expect(response).to redirect_to(@recipe)
      end
    end

    describe "DELETE #destroy" do

      it "deletes a recipe" do
        recipe = create :recipe
        delete :destroy, id: recipe.id
        expect(Recipe.count).to eq 0
      end
    end

    describe "POST #add_to_cookbook" do

      let(:cookbook_params) do
        {cookbook_id: 1}
      end

      before :each do
        @recipe = create :recipe
        @cookbook = create :cookbook
        post :add_to_cookbook, id: @recipe.id, cookbook: cookbook_params
      end

      it "adds the recipe to the cookbook" do
        expect(@cookbook.recipes).to include(@recipe)
      end
    end
  end
end
