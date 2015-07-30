require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    before :each do
      ingredient = create :ingredient
      get :index, id: ingredient.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index view" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before :each do
      ingredient = create :ingredient
      get :show, id: ingredient.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # #TODO: WHY NOT WORKING?
    # it "renders the new view" do
    #   create :user
    #   session[:user_id] = 1
    #   expect(response).to render_template("new")
    # end
  end

  describe "POST #create" do
    context "valid ingredient params" do
      before :each do
        create :user
        session[:user_id] = 1
        post :create, ingredient: attributes_for(:ingredient)
      end

      it "creates an Ingredient" do
        expect(Ingredient.count).to eq 1
      end

      it "redirects to the show page" do
        expect(subject).to redirect_to ingredient_path(Ingredient.first.id)
      end
    end

    context "invalid ingredient params" do
      before :each do
        create :user
        session[:user_id]
        post :create, ingredient: attributes_for(:ingredient, name: nil)
      end

      it "does not create a ingredient" do
        expect(Ingredient.count).to eq 0
      end

      # #TODO: NOT WORKING AND NO ONE KNOWS WHY
      # it "renders the new view" do
      #   expect(response).to render_template :new
      # end
    end
  end

# WIP
  describe "GET #edit" do
    before :each do
      create :ingredient
      get :edit
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the edit view" do
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT update/:id" do

    before :each do
      @ingredient = create :ingredient
      user = create :user
      session[:user_id] = 1

      put :update, user_id: user.id, id: 1, :ingredient => { name: "New Name"}
      @ingredient.reload
    end

    it "updates the ingredient record" do
      expect(response).to redirect_to(@ingredient)

      expect(@ingredient.name).to eq("New Name")
    end

    it "redirects to the ingredient show page" do
      expect(subject).to redirect_to ingredient_path(@ingredient)
    end
  end
  #
  # describe "DELETE #destroy" do
  #
  #   before :each do
  #     @ingredient = create :ingredient
  #     create :user
  #     session[:user_id] = 1
  #   end
  #
  #   it "deletes the record" do
  #     expect{
  #       delete :destroy, id: @ingredient.id
  #     }.to change(Ingredient, :count).by(-1)
  #   end
  # end

end
