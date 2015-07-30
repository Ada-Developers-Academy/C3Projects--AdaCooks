require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

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

  
end
