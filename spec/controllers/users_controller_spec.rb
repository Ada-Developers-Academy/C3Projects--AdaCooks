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

      it "creates a new user" do
        post :create, :user => valid_params
        expect(User.count).to eq 1
      end
    end

    # write test for redirect to user#dashboard when dashboard is created
    context "invalid params" do
      let(:invalid_params) do
        { username: "stimpy", password: "1111", password_confirmation: "1234" }
      end

      before :each do
        post :create, :user => invalid_params
      end

      it "does not create a new user" do
        expect(User.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end
end
