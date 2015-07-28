require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #root" do
    let(:ingredient) { create :ingredient }
    let(:recipe) { create :recipe }

    it "reponds successfully" do
      get :root
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the root template" do
      get :root
      expect(response).to render_template("root")
    end

    it "assigns @random_ingredient" do
      get :root
      expect(assigns(:random_ingredient)).to eq(ingredient)
    end

    it "assigns @random_recipe" do
      get :root
      expect(assigns(:random_recipe)).to eq(recipe)
    end
  end
end
