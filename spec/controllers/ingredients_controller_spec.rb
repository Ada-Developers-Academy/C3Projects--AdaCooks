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

    context "valid params" do
    before :each do session[:user_id] = 1 end

      it "creates an ingredient" do
        post :create, ingredient.attributes
        expect(Ingredient.count).to eq(1)
      end

      it "redirects after successfully creating a new ingredient" do
        post :create, ingredient.attributes
        expect(response).to redirect_to(ingredients_path)
      end
    end

    context "invalid params" do
      before :each do
        session[:user_id] = 1
      end
      let(:ingredient_params) do
        {
          ingredient: {
            name: nil
          }
        }
      end

      it "doesn't persist invalid ingredients" do
        post :create, ingredient_params
        expect(Ingredient.count).to eq(0)
      end

      it "renders :new ingredient form" do
        post :create, ingredient_params
        expect(response).to redirect_to(ingredients_path)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do session[:user_id] = 1 end
    let(:ingredient) { create :ingredient }

    it "destroys the object" do
      delete :destroy, ingredient.attributes
      expect(response).to redirect_to(ingredients_path)
    end
  end
end
