require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #new" do
    before :each do
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
end
