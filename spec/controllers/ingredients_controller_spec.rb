require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET #index and #show page for not logged in user" do
    it "renders the #index view" do
      get :index

      expect(response.status).to eq 200
      expect(response).to render_template("index")
    end

    it "creates a variable with ingredients in alphabetical order" do
      %w(pumpkin fish banana mushroom oil salt).each do |name|
        create(:ingredient, name: name)
      end
      get :index

      expect(assigns(:ingredients).first.name).to eq "banana"
    end

    it "renders the #show view" do
      ingredient = create :ingredient
      get :show, id: ingredient.id

      expect(response.status).to eq 200
      expect(response).to render_template("show")
    end
  end

  describe "Logging in creates more access" do

    context "you can't access #new anonymously" do
      it "get #new redirects anonymous user to login" do
        get :new

        expect(response).to redirect_to login_path
        expect(response).to have_http_status(302)
      end
    end

    context "Logged in users can access #new" do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: user
      end

      it "makes a new ingredient" do
        expect(assigns(:ingredient)).to be_a Ingredient
      end

      it "renders the #new view" do
        expect(response.status).to eq 200
        expect(response).to render_template("new")
      end
    end
  end

  describe "Logged in users can edit and delete their own ingredients" do
    before :each do
      user = create :user
      session[:user_id] = user.id
      @ingredient = create :ingredient
      get :edit, id: @ingredient.id
    end

    it "renders the #edit view" do
      expect(response.status).to eq 200
      expect(response).to render_template :edit
    end

    it "redirects other users to their dashboard" do
      @unauth_user = create :user, username: "wronguser"
      session[:user_id] = @unauth_user
      get :edit, id: @ingredient.id

      expect(subject).to redirect_to user_path(id: @unauth_user.id)
    end
  end

  describe "PUT #update" do
    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
      @ingredient = create(:ingredient)
    end

    context "no name" do
      before :each do
        put :update, id: @ingredient.id, ingredient: attributes_for(:ingredient, name: "")
      end

      it "does not make the change" do
        expect(@ingredient.name).to eq "yams"
      end

      it "renders to the edit form" do
        expect(subject).to render_template :edit
      end
    end

    context "valid edit" do
      before :each do
        put :update, id: @ingredient.id, ingredient: attributes_for(:ingredient, name: "sweet potatoes")
        @ingredient.reload
      end

      it "saves the updates" do
        expect(@ingredient.name).to eq "sweet potatoes"
      end

      it "redirects to the ingredient show page" do
        expect(subject).to redirect_to ingredient_path(@ingredient)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the record" do
      user = create(:user)
      session[:user_id] = user.id
      ingredient = create(:ingredient)
      delete :destroy, id: ingredient.id

      expect(Ingredient.all.count).to eq 0
    end
  end
end
