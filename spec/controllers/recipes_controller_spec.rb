require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    before :each do
      create :ingredient
      create :recipe
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index view" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before :each do
      create :ingredient
      recipe = create :recipe
      create :user
      get :show, id: recipe.id
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    context "logged in user" do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :new
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the new view" do
        expect(response).to render_template("new")
      end
    end

    context "not logged in user" do
      before :each do
        session[:user_id] = nil
        get :new
      end

      it "does not respond successfully" do
        expect(response).to_not be_success
      end

      it "redirects to the home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    context "valid recipe params" do
      before :each do
        create :user
        create :ingredient
        session[:user_id] = 1
        session[:previous_url] = "/"
        post :create, recipe: attributes_for(:recipe)
      end

      it "creates a Recipe" do
        expect(Recipe.count).to eq 1
      end

      it "redirects back" do
        expect(subject).to redirect_to "/"
      end
    end

    context "invalid recipe params" do
      before :each do
        user = create :user
        create :ingredient
        session[:user_id] = user.id
        post :create, recipe: attributes_for(:recipe, name: nil)
      end

      it "does not create a recipe" do
        expect(Recipe.count).to eq 0
      end

      it "renders the new view" do
        expect(response).to render_template("new", session[:user_id])
      end
    end
  end

  describe "PUT update/:id" do

    before :each do
      create :ingredient
      @recipe = create :recipe
      user = create :user
      session[:user_id] = 1

      put :update, user_id: user.id, id: 1, :recipe => { name: "New Name"}
      @recipe.reload
    end

    it "updates the recipe record" do
      expect(response).to redirect_to(@recipe)

      expect(@recipe.name).to eq("New Name")
    end

    it "redirects to the recipe show page" do
      expect(subject).to redirect_to recipe_path(@recipe)
    end
  end

  describe "DELETE #destroy" do

    before :each do
      create :ingredient
      @recipe = create :recipe
      @user = create :user
      session[:user_id] = 1
    end

    it "deletes the record" do
      delete :destroy, id: @recipe.id

      expect(Recipe.count).to eq 0
    end

    it "redirects to recipes#index" do
      delete :destroy,  id: @recipe.id
      expect(response).to redirect_to user_path(session[:user_id])
    end

    it "does not delete associated ingredients" do
      ingredient1 = create :ingredient, name: "Some Ingredient"
      ingredient2 = create :ingredient, name: "Another Ingredient"
      @recipe.ingredients << [ ingredient1, ingredient2 ]

      delete :destroy, id: @recipe.id
      expect(Ingredient.all).to include(ingredient1)
      expect(Ingredient.all).to include(ingredient2)
    end

    it "does not delete associated cookbooks" do
      cookbook = create :cookbook
      @recipe.cookbooks << cookbook

      delete :destroy, id: @recipe.id
      expect(Cookbook.all).to include(cookbook)
    end
  end
end
