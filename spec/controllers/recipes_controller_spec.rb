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

  describe "GET #new" do
    before :each do
      get :new
    end

    it "makes a new recipe" do
      expect(assigns(:recipe)).to be_a Recipe
    end

    it "renders the form" do
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "POST #create" do
    context "no name" do
      before :each do
        post :create, recipe: attributes_for(:recipe, name: "")
      end

      it "does not save to the db" do
        expect(Recipe.all.count).to eq 0
      end

      it "renders the form again" do
        expect(subject).to render_template :new
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:new_recipe_error])
      end
    end

    context "no preparation" do
      before :each do
        post :create, recipe: attributes_for(:recipe, preparation: "")
      end

      it "does not save to the db" do
        expect(Recipe.all.count).to eq 0
      end

      it "renders the form again" do
        expect(subject).to render_template :new
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:new_recipe_error])
      end
    end

    context "valid recipe" do
      before :each do
        post :create, recipe: attributes_for(:recipe)
      end

      it "saves the recipe to the db" do
        expect(Recipe.all.count).to eq 1
      end

      it "is associated with the correct user" do
        user = create(:user)
        recipe = Recipe.find(1)

        expect(recipe.user.id).to eq user.id
      end
    end
  end
end
