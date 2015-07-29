require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  describe "GET #new" do
    before :each do
      get :new
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the new template" do
      expect(response).to render_template "new" 
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:valid_params) do
        { name: "a name", description: "a description", user_id: 1 }
      end

      it "creates a new cookbook" do
        post :create, cookbook: valid_params
        expect(Cookbook.count).to eq 1
      end
    # write test for redirect to cookbook#show when dashboard is created
    end

    context "invalid params" do
      let(:invalid_params) do
        { name: "a name", description: "a description", user_id: nil }
      end

      before :each do
        post :create, cookbook: invalid_params
      end

      it "does not create a new cookbook" do
        expect(Cookbook.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:cookbook) { create :cookbook }
    before :each do
      get :edit, id: cookbook
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "PUT #update" do
    let(:cookbook) { create :cookbook }

    context "valid params" do
      before :each do
        put :update, id: cookbook, cookbook: { 
          name: 'updated name', description: 'updated description', user_id: 1
        }
      end

      it "updates an cookbook with valid params" do
        cookbook.reload
        expect(cookbook.name).to eq "updated name"
      end

      # write test for redirect to cookbook#show when view exists
    end

    context "invalid params" do # missing user_id
      before :each do
        put :update, id: cookbook, cookbook: {
          name: 'updated name', description: 'updated description', user_id: nil
        }
      end

      it "does not update a cookbook with invalid params" do
        cookbook.reload
        expect(cookbook.name).to_not eq "updated name"
      end

      it "renders the :edit template" do
        expect(response).to render_template "edit"
      end
    end
  end
end
