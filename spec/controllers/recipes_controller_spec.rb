require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:recipe) { create :recipe }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: recipe

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders show template" do
      get :show, id: recipe

      expect(response).to render_template("show")
    end
  end
end
