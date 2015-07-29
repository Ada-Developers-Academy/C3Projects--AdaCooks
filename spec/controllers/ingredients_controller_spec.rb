require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  let(:ingredient) { create :ingredient }

  describe "GET #index" do
    it "responds successfully" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @ingredients" do
      get :index
      expect(assigns(:ingredients)).to include(ingredient)
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, id: ingredient
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :show, id: ingredient
      expect(response).to render_template("show")
    end

    it "assigns @ingredient" do
      get :show, id: ingredient
      expect(assigns(:ingredient)).to eq(ingredient)
    end
  end
end
