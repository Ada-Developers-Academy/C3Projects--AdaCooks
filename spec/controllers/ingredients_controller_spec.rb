require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end


  describe "GET #new" do
    let(:user) { create :user }
    
    before :each do
      session[:user_id] = user.id
      get :new
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the new template" do
      expect(response).to render_template "new"
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:valid_params) do
        { name: "a name" }
      end

      before :each do
        @user = create :user
        session[:user_id] = @user.id
        session[:last_page] = ingredient_path(1)
        post :create, ingredient: valid_params
      end

      it "creates a new ingredient" do
        expect(Ingredient.count).to eq 1
      end

      it "redirects to the new ingredient #show" do
        expect(response).to redirect_to ingredient_path(Ingredient.first)
      end
    end

    context "invalid params" do
      let(:invalid_params) do
        { name: nil } # missing name
      end

      before :each do
        post :create, ingredient: invalid_params
      end

      it "does not create a new ingredient" do
        expect(Ingredient.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:ingredient) { create :ingredient }

    before :each do
      get :edit, id: ingredient
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "PUT #update" do
    let(:ingredient) { create :ingredient }

    context "valid params" do
      before :each do
        session[:last_page] = ingredient_path(ingredient)
        put :update, id: ingredient, ingredient: { name: 'updated name' }
        ingredient.reload
      end

      it "updates an ingredient with valid params" do
        expect(ingredient.name).to eq "updated name"
      end

      it "redirects to ingredient#show" do
        expect(response).to redirect_to ingredient_path(ingredient)
      end
    end

    context "invalid params" do # missing name
      before :each do
        put :update, id: ingredient, ingredient: { name: nil }
        ingredient.reload
      end

      it "does not update a ingredient with invalid params" do
        expect(ingredient.name).to_not be_nil
      end

      it "renders the :edit template" do
        expect(response).to render_template "edit"
      end
    end
  end

  describe "GET #show" do
    let(:ingredient) { create :ingredient }

    before :each do
      get :show, id: ingredient
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the show template" do
      expect(response).to render_template "show"
    end
  end

  describe "DELETE #destroy" do
    let(:ingredient) { create :ingredient }

    before :each do
      recipe = create :recipe
      ingredient.recipes << recipe
      delete :destroy, id: ingredient
    end

    it "deletes the ingredient" do
      expect(Ingredient.count).to eq 0
    end

    it "does not delete the associated recipes" do
      expect(Recipe.count).to eq 1
    end

    it "redirects to my_ingredients path" do
      expect(response).to redirect_to my_ingredients_path
    end
  end
end
