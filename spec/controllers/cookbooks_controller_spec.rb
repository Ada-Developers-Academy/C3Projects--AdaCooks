require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  let(:user) { create :user}
  let(:cookbook) { create :cookbook, name: "Cookbook", user_id: 1 }

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

  describe "GET show"  do
    it "displays the appropriate cookbook information" do
      get :show, user_id: cookbook.user_id, id: cookbook.id
      expect(cookbook.name).to eq 'Cookbook'
    end
  end
end
