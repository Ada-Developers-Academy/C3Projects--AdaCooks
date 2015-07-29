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
        expect(Cookbook.count).to eq 2
      end

      it "redirects to the cookbook show page" do
        post :create, cookbook_params
        expect(response).to
        redirect_to(user_cookbook_path(user_id: cookbook.user_id, id: cookbook.id))
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
        expect(Cookbook.count).to eq 1
      end

      it "redirects to the #new page" do
        post :create, cookbook_params
        expect(response).to
        redirect_to(new_user_cookbook_path(user_id: cookbook.user_id))
      end
    end # end context
  end # end describe
end # end class
