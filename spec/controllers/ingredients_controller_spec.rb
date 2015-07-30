require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "get :index" do
    let(:ingredient_a) { create(:ingredient, name: "a") }
    let(:ingredient_b) { create(:ingredient, name: "b") }
    let(:ingredient_c) { create(:ingredient, name: "c") }

    it "assigns all ingredients to @ingredients" do
      5.times { create(:ingredient) }

      get :index

      expect(assigns(:ingredients).count).to eq(5)
    end

    it "assigns @ingredients in alphabetical order" do
      ingredient_b # need to create the records in the db out of alphabetical order
      ingredient_order = [ ingredient_a, ingredient_b, ingredient_c ]

      get :index

      expect(assigns(:ingredients).count).to eq(3)
      expect(assigns(:ingredients)).to eq(ingredient_order)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end
  end

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
