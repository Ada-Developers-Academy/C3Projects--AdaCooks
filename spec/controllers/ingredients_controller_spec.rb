require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    context "valid params" do
    let(:ingredient) { create :ingredient }

      it "creates an instance of Ingredient" do
        get :new, ingredient.attributes
        expect(ingredient).to be_kind_of(Ingredient)
      end
    end
  end

  describe "POST #create" do
    let(:ingredient) { create :ingredient }
    let(:invalid_ingredient) { build :ingredient, name: nil }

    context "valid params" do
      it "creates an ingredient" do
        post :create, ingredient.attributes
        expect(Ingredient.count).to eq(1)
      end

      it "redirects after successfully creating a new ingredient" do
        post :create, ingredient.attributes
        expect(response).to have_http_status(302)
      end
    end

    context "invalid params" do
      it "doesn't persist invalid ingredients" do
        post :create, invalid_ingredient.attributes
        expect(Ingredient.count).to eq(0)
      end

      # do render and redirect have the same http status code??
      # it "renders :new ingredient form" do
        # post :create, invalid_ingredient.attributes
        # expect(response).to have_http_status(200)
      # end
    end
  end

  describe "DELETE #destroy" do
    let(:ingredient) { create :ingredient }

    it "destroys the object" do
      delete :destroy, ingredient.attributes
      expect(Ingredient.count).to eq(0)
    end
  end
end
