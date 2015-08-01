require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "get #new" do
    before :each do
      get :new
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "post #create" do
    context "valid params" do
      let(:valid_params) do
        { username: "ren", password: "1111", password_confirmation: "1111" }
      end

      before :each do
        post :create, user: valid_params
      end

      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "redirects to my_recipes dashboard page" do
        expect(response).to redirect_to my_recipes_path
      end
    end

    context "invalid params" do
      let(:invalid_params) do
        { username: "stimpy", password: "1111", password_confirmation: "1234" }
      end

      before :each do
        post :create, user: invalid_params
      end

      it "does not create a new user" do
        expect(User.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #show" do
    let(:user) { create :user }

    before :each do
      get :show, id: user
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the show template" do
      expect(response).to render_template "show"
    end
  end

  describe "GET #edit" do
    let(:user) { create :user }

    before :each do
      session[:user_id] = user.id
      get :edit, id: user
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "PUT #update" do
    let(:user) { create :user }

    context "valid params" do
      before :each do
        session[:user_id] = user.id
        put :update, id: user, user: { 
          username: 'updated username', 
          password: 111, password_confirmation: 111
        }
        user.reload
      end

      it "updates an user with valid params" do
        expect(user.username).to eq "updated username"
      end

      it "redirects to user#show" do
        expect(response).to redirect_to user_path(user)        
      end
    end

    context "invalid params" do # missing password
      before :each do
        session[:user_id] = user.id
        put :update, id: user, user: {
          username: "updated username",
          password: nil, password_confirmation: nil
        }
        user.reload
      end

      it "does not update a user with invalid params" do
        expect(user.username).to_not eq "updated username"
      end

      it "renders the :edit template" do
        expect(response).to render_template "edit"
      end
    end
  end

  describe "GET #my_recipes" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
      get :my_recipes
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("my_recipes")
    end
  end

  describe "GET #my_cookbooks" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
      get :my_cookbooks
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("my_cookbooks")
    end
  end

  describe "GET #my_ingredients" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
      get :my_ingredients
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      expect(response).to render_template("my_ingredients")
    end
  end
end
