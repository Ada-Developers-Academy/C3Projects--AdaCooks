require 'rails_helper'
require 'pry'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    subject { post :create, :user => { name: "User", email: "soandso@so.com", password: "soandso", password_confirmation: "soandso", id: 1} }

    it "redirects to the :dashboard view" do
      expect(subject).to redirect_to("/users/#{assigns(:user).id}/dashboard")
    end
  end

  describe "invalid user registration" do
    it "flashes errors when invalid" do
      post :create, user: {email: nil}

      expect(flash[:error]).to eq("Registration failed, try again.")
    end
  end



  describe "GET #dashboard" do
    it "renders dashboard for logged in users" do
      user = create :user, id: 88
      session[:user_id] = user.id
      get :dashboard, id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:dashboard)
    end

    it "doesn't render dashboard for guest users" do
      user = create :user, id: 88
      session[:user_id] = nil
      get :dashboard, id: user.id

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(login_path)
    end
  end

  describe "GET #profile" do
    it "renders the user profile" do
      user = create :user
      get :profile, id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:profile)
    end

    it "shows the user's cookbooks" do
      user = create :user
      cookbook1 = create :cookbook, name: "1", user_id: user.id
      cookbook2 = create :cookbook, name: "2", user_id: user.id
      cookbooks = [cookbook1, cookbook2]
      get :profile, id: user.id

      expect(Cookbook.where(user_id: user.id)).to eq(cookbooks)
    end

    it "shows the user's recipes" do
      user = create :user
      ingredient = create :ingredient
      recipe1 = create :recipe, name: "1", user_id: user.id, ingredient_ids: [ingredient.id]
      recipe2 = create :recipe, name: "2", user_id: user.id, ingredient_ids: [ingredient.id]
      recipes = [recipe1, recipe2]
      get :profile, id: user.id

      expect(Recipe.where(user_id: user.id)).to eq(recipes)
    end

    it "shows the user's ingredients" do
      user = create :user
      ingredient1 = create :ingredient, name: "1", user_id: user.id
      ingredient2 = create :ingredient, name: "2", user_id: user.id
      ingredients = [ingredient1, ingredient2]
      get :profile, id: user.id

      expect(Ingredient.where(user_id: user.id)).to eq(ingredients)
    end
  end
end
