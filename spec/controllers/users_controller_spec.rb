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
    let(:valid_params) do
      { username: "ren", password: "1111", password_confirmation: "1111" }
    end

    it "creates a new user" do
      post :create, :user => valid_params
      expect(User.count).to eq 1
    end
  end
end
