require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  # INDEX ACTION__________________________________________________________________

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  # SHOW ACTION__________________________________________________________________

  describe "GET #show" do
    before :each do
      @ingredient = create :ingredient
    end

    it "returns successfully with an HTTP 200 status code" do
      get :show, id: @ingredient.id

      expect(response).to be_success
    end

    it "renders the show view" do
      get :show, id: @ingredient.id

      expect(response).to render_template("show")
    end
  end

  # NEW ACTION__________________________________________________________________

  describe "GET #new" do
    before :each do
      @ingredient = build :ingredient
      user = create :user
      session[:user_id] = user.id
    end

    it "renders the new view" do
      get :new

      expect(response).to render_template("new")
    end
  end

  # # CREATE ACTION__________________________________________________________________

  describe "POST #create" do
    before :each do
      user = create :user
      session[:user_id] = user.id
    end

    context "with valid params" do

      let (:params) do { name: "name"  }
      end

      it "creates a new Ingredient record" do
        post :create, :ingredient => params

        expect(Ingredient.count).to eq(1)
      end
    end

    context "with invalid Ingredient params" do
      let (:bad_params) do { name: nil }
      end

      it "doesn't create a new Ingredient" do
        post :create, :ingredient => bad_params

        expect(response).to render_template(:new)
      end
    end
  end

  # EDIT ACTION__________________________________________________________________

  describe "GET #edit" do
    before :each do
      @ingredient = create :ingredient
      user = create :user
      session[:user_id] = user.id
    end

    it "renders the edit view" do
      get :edit, id: @ingredient.id

      expect(response).to render_template("edit")
    end
  end

  # # UPDATE ACTION__________________________________________________________________
  describe "PATCH #update" do
    it "returns updates an ingredient record" do
      user = create :user
      session[:user_id] = user.id
      ingredient = create :ingredient
      old_name = ingredient.name

      patch :update, id: ingredient.id, ingredient: { name: "updated name" }
      ingredient.reload

      expect(ingredient.name).to eq("updated name")
    end
  end

  # # SEARCH ACTION__________________________________________________________________
  # describe "GET #search" do
  #
  #   it "renders search page" do
  #
  #     let(:params[:search]) do { name: "Tomato" }
  #     end
  #
  #     ingredient = create :ingredient
  #
  #     get :search
  #     expect(response).to render_template(:search)
  #   end
  # end
end
