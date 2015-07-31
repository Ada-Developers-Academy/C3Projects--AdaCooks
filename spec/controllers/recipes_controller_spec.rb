require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:recipe) { create :recipe }

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @recipes" do
      get :index
      expect(assigns(:recipes)).to include(recipe)
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, id: recipe
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :show, id: recipe
      expect(response).to render_template("show")
    end

    it "assigns @recipe" do
      get :show, id: recipe
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "GET #new" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders new template" do
      get :new, user_id: @user.id
      expect(response).to render_template("new")
    end

    it "assigns @authenticated_user" do
      get :new, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :new, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current recipe" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :new, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #edit" do
    before :each do
      @user = create :user
      @recipe = create :recipe, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: @recipe.id, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders edit template" do
      get :edit, id: @recipe.id, user_id: @user.id
      expect(response).to render_template("edit")
    end

    it "assigns @recipe" do
      get :edit, id: @recipe.id, user_id: @user.id
      expect(assigns(:recipe)).to eq(@recipe)
    end

    it "assigns @authenticated_user" do
      get :edit, id: @recipe.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @recipe.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current recipe" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @recipe.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    before :each do
      @user = create :user
      @recipe = attributes_for :recipe
      session[:user_id] = @user.id
    end

    it "assigns @authenticated_user" do
      post :create, recipe: @recipe, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "valid form input" do
      it "redirects to newly created recipe's show page" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(response).to have_http_status(302)
      end

      it "creates a new recipe" do # OPTIMIZE: this creates new recipe test
        post :create, recipe: @recipe, user_id: @user.id
        expect(assigns(:recipe).class).to eq(Recipe)
        expect(assigns(:recipe)).to be_valid
      end

      it "flashes an error message" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:false].nil?).to eq(true)
      end
    end

    context "invalid form input" do
      before :each do
        @recipe = attributes_for :recipe, name: nil
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders new template" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(response).to render_template("new")
      end

      it "flashes an error message" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end

    context "authenticated users that don't own current recipe" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        post :create, recipe: @recipe, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @user = create :user
      @recipe = create :recipe
      @params = attributes_for :recipe
      session[:user_id] = @user.id
    end

    it "assigns @authenticated_user" do
      patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "valid form input" do
      it "redirects to newly created recipe's show page" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(recipe_path(@recipe))
      end

      it "updates the recipe" do # OPTIMIZE: this creates new recipe test
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(assigns(:recipe).class).to eq(Recipe)
        expect(assigns(:recipe)).to be_valid
        expect(assigns(:recipe).id).to eq(@recipe.id)
      end

      it "flashes a success message" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(flash[:success].nil?).to eq(false)
        expect(flash[:error].nil?).to eq(true)
      end
    end

    context "invalid form input" do
      before :each do
        @params = attributes_for :recipe, name: nil
      end

      it "responds successfully with an HTTP 200 status code" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders edit template" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(response).to render_template("edit")
      end

      it "flashes an error message" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end

    context "authenticated users that don't own current recipe" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        patch :update, id: @recipe.id, recipe: @params, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = create :user
      @recipe = create :recipe, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "redirects to recipes#index" do
      delete :destroy, id: @recipe.id, user_id: @user.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(recipes_path)
    end

    it "assigns @recipe" do
      delete :destroy, id: @recipe.id, user_id: @user.id
      expect(assigns(:recipe)).to eq(@recipe)
    end

    it "assigns @authenticated_user" do
      delete :destroy, id: @recipe.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    it "DESTROYS the recipe" do
      delete :destroy, id: @recipe.id, user_id: @user.id
      expect(Recipe.find_by(id: @recipe.id)).to eq(nil)
    end

    it "flashes a success message" do
      delete :destroy, id: @recipe.id, user_id: @user.id
      expect(flash[:success].nil?).to eq(false)
      expect(flash[:error].nil?).to eq(true)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @recipe.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        delete :destroy, id: @recipe.id, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end

    context "authenticated users that don't own current recipe" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @recipe.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        delete :destroy, id: @recipe.id, user_id: @user.id
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end
  end
end
