require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    before :each do
      %w(Happy Lovely Pig Darling Appetite Bumpkin).each do |name|
        create(:recipe, name: name)
      end
    end

    it "instantiates a variable that is all the recipes in alpha_order" do
      get :index

      expect(assigns(:recipes).first.name).to eq "Appetite"
    end

    it "renders the recipes#index view" do
      get :index

      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET #show" do
    context "not logged in user" do
      let(:recipe) { create(:recipe) }

      it "renders the show page" do
        get :show, id: recipe.id

        expect(response.status).to eq 200
        expect(subject).to render_template :show
      end

      it "instantiates a variable to store the recipe" do
        get :show, id: recipe.id
        
        expect(assigns(:recipe).id).to eq 1
      end
    end
  end
end
