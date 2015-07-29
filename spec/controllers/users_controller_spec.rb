require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      user = create :user
      get :show, id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new view" do
      user = create :user
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    context "user not logged in" do
      it "responds successfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the new view" do
        get :new
        expect(response).to render_template("new")
      end
    end

    context "user logged in" do
      it "redirects logged in user to home page" do
        session[:user_id] = 1
        get :new

        expect(response).to redirect_to(root_path)
      end

      it "flashes error message" do
        session[:user_id] = 1
        get :new

        expect(flash[:errors]).to include("You already have an account!")
      end
    end
  end

  describe "POST #create" do
    context "valid user params" do
      it "creates a user" do
        build :user
        post :create, user: attributes_for(:user)

        expect(User.count).to eq 1
      end

      it "redirects to the home page" do
        build :user
        post :create, user: attributes_for(:user)

        expect(subject).to redirect_to(root_path)
      end

      it "creates a session" do
        build :user
        post :create, user: attributes_for(:user)

        expect(session[:user_id]).to eq 1
      end
    end

    context "invalid user params" do
      it "flashes error message" do
        user = build :user, username: nil
        post :create, user: attributes_for(:user, username: nil)

        expect(user).to_not be_valid
        expect(flash[:errors]).to include("There was a problem with your signup info. Please try again!")
      end

      it "renders the new view" do
        post :create, user: attributes_for(:user, username: nil)

        expect(response).to render_template(:new)
      end
    end
  end
end
