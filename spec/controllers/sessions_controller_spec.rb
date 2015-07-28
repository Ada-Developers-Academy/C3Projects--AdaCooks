require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before(:each) do
    @user = User.create(username: "penguin", password: "unigoat", password_confirmation: "unigoat")
  end

describe "POST #create" do
    context "with valid params" do

      let (:valid_params) do
        { username: "penguin", password: "unigoat" }
      end

      it "creates an authenticated session" do
        post :create, :session => valid_params
        expect(session[:user_id]).to eq 1
      end
    end

    context "with invalid params" do

      let (:invalid_params) do
        { username: "penguin", password: "unigroat" }
      end

      it "does not create an authenticated session" do
        post :create, :session => invalid_params
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe "delete #DESTROY" do
    before(:each) do
      session[:user_id] = @user.id
      delete :destroy
    end

    it "signs the user out" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects user to home" do
      expect(response).to redirect_to(root_path)
    end
  end
end
