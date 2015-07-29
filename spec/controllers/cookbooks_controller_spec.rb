require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
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
        { name: "a name", description: "a description", user_id: 1 }
      end

      it "creates a new cookbook" do
        post :create, :cookbook => valid_params
        expect(Cookbook.count).to eq 1
      end
    # write test for redirect to cookbook#show when dashboard is created
    end

    context "invalid params" do
      let(:invalid_params) do
        { name: "a name", description: "a description", user_id: nil }
      end

      before :each do
        post :create, :cookbook => invalid_params
      end

      it "does not create a new cookbook" do
        expect(Cookbook.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end
end
