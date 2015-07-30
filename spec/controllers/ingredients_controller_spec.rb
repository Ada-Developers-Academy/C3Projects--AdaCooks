require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "get :show" do
    let(:ingredient) { create(:ingredient) }

    it "assigns @ingredient" do
      get :show, { id: ingredient.id }

      expect(assigns(:ingredient)).to eq(ingredient)
    end

    it "renders the show template" do
      get :show, { id: ingredient.id }

      expect(response).to render_template("show")
    end
  end
end
