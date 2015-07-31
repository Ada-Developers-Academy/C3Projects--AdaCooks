require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  let(:cookbook) { create :cookbook }

  describe "GET #index" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index, user_id: @user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, user_id: @user.id

      expect(response).to render_template("index")
    end

    it "assigns @cookbooks" do
      cookbook = create :cookbook, user_id: @user.id
      get :index, user_id: @user.id

      expect(assigns(:cookbooks)).to include(cookbook)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :index, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current cookbook" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :index, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #new" do
    before :each do
      @user = create :user
      @cookbook = create :cookbook, user_id: @user.id
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

    context "authenticated users that don't own current cookbook" do
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

  describe "GET #show" do
    before :each do
      @user = create :user
      @cookbook = create :cookbook, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @cookbook.id, user_id: @user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders show template" do
      get :show, id: @cookbook.id, user_id: @user.id

      expect(response).to render_template("show")
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :show, id: @cookbook.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current cookbook" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :show, id: @cookbook.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #edit" do
    before :each do
      @user = create :user
      @cookbook = create :cookbook, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: @cookbook.id, user_id: @user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders edit template" do
      get :edit, id: @cookbook.id, user_id: @user.id

      expect(response).to render_template("edit")
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @cookbook.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current cookbook" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        get :edit, id: @cookbook.id, user_id: @user.id

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    before :each do
      @user = create :user
      @cookbook = attributes_for :cookbook
      session[:user_id] = @user.id
    end

    it "assigns @authenticated_user" do
      post :create, cookbook: @cookbook, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "valid form input" do
      it "redirects to newly created cookbook's show page" do
        post :create, cookbook: @cookbook, user_id: @user.id
        expect(response).to have_http_status(302)
      end

      it "creates a new cookbook" do
        post :create, cookbook: @cookbook, user_id: @user.id
        expect(assigns(:cookbook).class).to eq(Cookbook)
        expect(assigns(:cookbook)).to be_valid
      end
    end

    context "invalid form input" do
      before :each do
        @cookbook = attributes_for :cookbook, name: nil
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, cookbook: @cookbook, user_id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders new template" do
        post :create, cookbook: @cookbook, user_id: @user.id
        expect(response).to render_template("new")
      end
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        post :create, cookbook: @cookbook, user_id: @user.id
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
        post :create, cookbook: @cookbook, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @user = create :user
      @cookbook = create :cookbook
      @params = attributes_for :cookbook
      session[:user_id] = @user.id
    end

    it "assigns @authenticated_user" do
      patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    context "valid form input" do
      it "redirects to newly created cookbook's show page" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(response).to have_http_status(302)
      end

      it "updates the cookbook" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(assigns(:cookbook).class).to eq(Cookbook)
        expect(assigns(:cookbook)).to be_valid
        expect(assigns(:cookbook).id).to eq(@cookbook.id)
      end
    end

    context "invalid form input" do
      before :each do
        @params = attributes_for :cookbook, name: nil
      end

      it "responds successfully with an HTTP 200 status code" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders edit template" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(response).to render_template("edit")
      end
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current cookbook" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        patch :update, id: @cookbook.id, cookbook: @params, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = create :user
      @cookbook = create :cookbook, user_id: @user.id
      session[:user_id] = @user.id
    end

    it "redirects to cookbooks#index" do
      delete :destroy, id: @cookbook.id, user_id: @user.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_cookbooks_path)
    end

    it "assigns @cookbook" do
      delete :destroy, id: @cookbook.id, user_id: @user.id
      expect(assigns(:cookbook)).to eq(@cookbook)
    end

    it "assigns @authenticated_user" do
      delete :destroy, id: @cookbook.id, user_id: @user.id
      expect(assigns(:authenticated_user)).to eq(@user)
    end

    it "DESTROYS the cookbook" do
      delete :destroy, id: @cookbook.id, user_id: @user.id
      expect(Cookbook.find_by(id: @cookbook.id)).to eq(nil)
    end

    context "unauthenticated users" do
      before :each do
        session[:user_id] = nil
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @cookbook.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context "authenticated users that don't own current cookbook" do
      before :each do
        @user2 = create :user, username: "another user", email: "another@use.r"
        session[:user_id] = @user2.id
      end

      it "does not permit access / redirects to the home page" do
        delete :destroy, id: @cookbook.id, user_id: @user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
