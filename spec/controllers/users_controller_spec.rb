require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe "GET #show" do
    it "responds successfully" do
      get :show, user_id: user.id
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :show template" do
      get :show, user_id: user.id
      expect(response).to render_template("show")
    end

    it "assigns @user" do
      get :show, user_id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #signup" do
    it "responds successfully" do
      get :signup
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :signup template" do
      get :signup
      expect(response).to render_template("signup")
    end
  end

  describe "POST #create" do
    context "valid form input" do
      before :each do
        @params = attributes_for :user
      end

      it "redirects to newly created user's show page" do
        post :create, user: @params
        expect(response).to have_http_status(302)
      end

      it "creates a new user" do # OPTIMIZE: this creates new user test
        post :create, user: @params
        expect(assigns(:user).class).to eq(User)
        expect(assigns(:user)).to be_valid
      end
    end

    context "invalid form input" do
      before :each do
        @params = attributes_for :user, username: nil
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, user: @params
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders signup template" do
        post :create, user: @params
        expect(response).to render_template("signup")
      end
    end
  end
end
