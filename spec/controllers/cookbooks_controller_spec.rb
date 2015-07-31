require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  let(:user) { create :user}
  let(:cookbook) { create :cookbook, name: "Cookbook", user_id: 1 }
  before(:each) do
    session[:user_id] = 1
  end

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, user_id: user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, user_id: user.id
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "displays the appropriate cookbook information" do
      get :show, user_id: cookbook.user_id, id: cookbook.id
      expect(cookbook.name).to eq 'Cookbook'
    end
  end

  describe "POST create" do
    context "valid cookbook params" do
      let(:cookbook_params) do {
        cookbook:{
          name: 'Get in My Belly'
        }
      }
      end

      it "creates a cookbook record" do
        post :create, cookbook_params
        expect(Cookbook.count).to eq 1
      end
    end

    context "invalid cookbook params" do
      let(:cookbook_params) do {
        cookbook:{
          name: nil
        }
      }
      end

      it "does not create a cookbook record" do
        post :create, cookbook_params
        expect(Cookbook.count).to eq 0
      end

    end # end context
  end # end describe

  describe "PUT edit" do
    it "updates an existing record" do
      post :update, id: cookbook, cookbook: { name: "Cooking with Dirt" }
      cookbook.reload
      expect(cookbook.name).to eq "Cooking with Dirt"
    end
  end

  describe "PUT update" do
    let(:recipe) { create :recipe }
    let(:cookbook) { create :cookbook }
    let(:params) { { :recipe => { cookbook_id: 1 }, id: 1 } }

    before :each do
      create :user
      recipe
      cookbook # same deal
    end

    it "adds the recipe to the cookbook" do
      put :update, params
      expect(cookbook.recipes).to include recipe
    end

    it "sends a flash notice that the recipe has been added" do
      put :update, params
      expect(flash[:notice]).to_not be nil
    end

    it "redirects the user back to the recipe :show view" do
      put :update, params
      expect(subject).to redirect_to recipe_path(recipe.id)
    end
  end

  describe "DELETE destroy" do
    it "deletes an existing record" do
      delete :destroy, id: cookbook
      expect(Cookbook.count).to eq 0
    end
  end
end # end class
