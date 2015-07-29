require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  # FIXME: Figure out how to test this since we are not using a new view
  # describe "GET #new" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :new
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe "POST #create" do
    it "without login, session[:user_id] is nil" do
      create :user

      expect(session[:user_id]).to be nil
    end

    context "valid user params" do
      # FIXME: Fix this so not using let
        let(:user_login_params) { { session: { username: "pusheen", password: "kittycat" } } }

      before :each do
        @user = create :user
        post :create, user_login_params
      end

      it "sets the user" do
        expect(assigns(:user)).to eq @user
      end

      it "sets session[:user_id] to the user's id" do
        expect(session[:user_id]).to eq @user.id
      end

      it "flashes message" do
        expect(flash[:messages]).to include("You have successfully logged in! Nice work!")
      end

      it "redirects to the home page" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "invalid user params" do
      # FIXME: Fix this so not using let
      let(:user_login_params) { { session: { username: "pusheen", password: "" } } }

      before :each do
        post :create, user_login_params
      end

      it "does not set the user" do
        expect(assigns(:user)).to be nil
      end

      it "does not set session[:user_id]" do
        expect(session[:user_id]).to be nil
      end

      it "flashes error message" do
        expect(flash[:errors]).to include("Invalid login. Please try again!")
      end

      it "redirects to home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user_login_params) { { session: {username: "pusheen", password: "kittycat"} } }

    before :each do
      delete :destroy, user_login_params
    end

    it "resets session[:user_id] to nil" do
      expect(session[:user_id]).to eq nil
    end

    it "flashes message" do
      expect(flash[:messages]).to include("You have logged out. We'll miss you.")
    end

    it "redirects to the home page"do
      expect(response).to redirect_to(root_path)
    end
  end
end
