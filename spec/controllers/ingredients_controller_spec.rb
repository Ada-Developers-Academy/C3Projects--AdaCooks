require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    before :each do
      ingredient = create :ingredient
      get :index, id: ingredient.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index view" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before :each do
      ingredient = create :ingredient
      get :show, id: ingredient.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end
end
