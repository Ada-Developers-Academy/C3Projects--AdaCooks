require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  let(:ingredient) { create :ingredient }

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

    it "assigns @ingredients" do
      get :index
      expect(assigns(:ingredients)).to include(ingredient)
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, id: ingredient
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :show, id: ingredient
      expect(response).to render_template("show")
    end

    it "assigns @ingredient" do
      get :show, id: ingredient
      expect(assigns(:ingredient)).to eq(ingredient)
    end
  end

  describe "GET #new" do
    before :each do
      @user = create :user
      # @ingredient = create :ingredient, user_id: @user.id
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

    # it "assigns @ingredient" do # FIXME: Ingredient.new??
    #   get :new, user_id: @user.id
    #   expect(assigns(:ingredient)).to eq(@ingredient)
    # end

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

    context "authenticated users that don't own current ingredient" do
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
      @ingredient = create :ingredient, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: @ingredient.id, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders edit template" do
      get :edit, id: @ingredient.id, user_id: @user.id
      expect(response).to render_template("edit")
    end

    it "assigns @ingredient" do
      get :edit, id: @ingredient.id, user_id: @user.id
      expect(assigns(:ingredient)).to eq(@ingredient)
    end

    it "assigns @authenticated_user" do
      get :edit, id: @ingredient.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current ingredient" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    before :each do
      @user = create :user
      @ingredient = build :ingredient, user_id: nil
      session[:user_id] = @user.id
    end

    it "assigns @ingredient" do
      post :create, id: @ingredient.id, user_id: @user.id
      expect(assigns(:ingredient)).to eq(@ingredient)
    end

    it "assigns @authenticated_user" do
      post :create, id: @ingredient.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "valid form input" do
      it "redirects to newly created ingredient's show page" do
        post :create, id: @ingredient.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(ingredient_path(@ingredient))
      end

      it "renders edit template" do
        post :create, id: @ingredient.id, user_id: @user.id
        expect(response).to render_template("edit")
      end
    end

    context "invalid form input" do
      it "responds successfully with an HTTP 200 status code" do
        post :create, id: @ingredient.id, user_id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders new template" do
        post :create, id: @ingredient.id, user_id: @user.id
        expect(response).to render_template("new")
      end
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        post :create, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current ingredient" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        post :create, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @user = create :user
      @ingredient = create :ingredient, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      patch :update, id: @ingredient.id, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders edit template" do
      patch :update, id: @ingredient.id, user_id: @user.id
      expect(response).to render_template("edit")
    end

    it "assigns @ingredient" do
      patch :update, id: @ingredient.id, user_id: @user.id
      expect(assigns(:ingredient)).to eq(@ingredient)
    end

    it "assigns @authenticated_user" do
      patch :update, id: @ingredient.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current ingredient" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = create :user
      @ingredient = create :ingredient, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "redirects to ingredients#index" do
      delete :destroy, id: @ingredient.id, user_id: @user.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(ingredients_path)
    end

    it "assigns @ingredient" do
      delete :destroy, id: @ingredient.id, user_id: @user.id
      expect(assigns(:ingredient)).to eq(@ingredient)
    end

    it "assigns @authenticated_user" do
      delete :destroy, id: @ingredient.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    it "DESTROYS the ingredient" do
      delete :destroy, id: @ingredient.id, user_id: @user.id
      expect(Ingredient.find_by(id: @ingredient.id)).to eq(nil)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current ingredient" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @ingredient.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
