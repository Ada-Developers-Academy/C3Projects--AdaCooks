require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      recipe = create :recipe
      get :show,  id: recipe.id

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      user = create :user
      session[:user_id] = 1
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET # edit" do
    it "renders an edit view" do
      user = create :user
      session[:user_id] = 1
      recipe = create :recipe
      get :edit, :id => recipe.id

      expect(response).to render_template('edit')
    end
  end

  describe "GET #create" do

    before :each do
      user = create :user, id: 1
      session[:user_id] = 1
      ingredient = create :ingredient
    end

    context "with valid params" do

      let (:params) do { name: "name", description: "some stuff", user_id: 1, preparation: "do some stuff", :ingredient_ids => [1]  }
      end

      it "creates a new Recipe record" do
        post :create, :recipe => params

        expect(Recipe.count).to eq(1)
      end
    end

    context "with invalid recipe params" do
      let (:bad_params) do { name: "a recipe name", description: "some stuff", user_id: 1 }
      end

      it "doesn't create a new recipe" do
        post :create, :recipe => bad_params

        expect(response).to render_template(:new)
      end
    end
  end


  describe "PATCH #update" do
    it "returns updates a recipe record" do
      user = create :user, id: 1
      session[:user_id] = 1
      recipe = create :recipe
      old_description = recipe.description

      patch :update, id: recipe.id, recipe: { id: 1, description: "BEST PIZZA EVER" }
      recipe.reload

      expect(recipe.description).to_not eq(old_description)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a recipe record from the database" do
      user = create :user, id: 1
      recipe = build :recipe
      get :destroy, :id => 1

      expect(Recipe.count).to eq (0)
    end
  end

  describe "POST #remove_recipes" do
    it "removes cookbook_id from recipe" do
      recipe = create :recipe, cookbook_id: 1
      cookbook = create :cookbook

      post :remove_recipes, :id => 1
      recipe.reload

      expect(recipe.cookbook_id).to eq(nil)
    end
  end
end
