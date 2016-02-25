require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #new template" do
      get :new
      expect(subject).to render_template :new
    end

    it "will redirect an already signed-in user back to the home page" do
      create :user
      session[:user_id] = 1
      get :new

      expect(subject).to redirect_to(root_path)
    end

    it "throw a flash error if already signed-in user" do
      create :user
      session[:user_id] = 1
      get :new

      expect(flash).to_not be_empty
    end
  end

  describe "#create" do
    context "valid user params" do
      it "creates a user" do
        post :create, { user: attributes_for(:user) }
        expect(User.count).to eq 1
      end
    end

    context "invalid user params" do
      let (:invalid) { { user: attributes_for(:user, username: "") } }

      it "does not create a user" do
        post :create, invalid
        expect(User.count).to eq 0
      end

      it "renders the new user page (if unsuccessful save)" do
        post :create, invalid
        expect(subject).to render_template(:new)
      end
    end
  end
end
