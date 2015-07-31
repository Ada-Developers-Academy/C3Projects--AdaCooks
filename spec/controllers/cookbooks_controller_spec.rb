require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    it "renders show view" do
      cookbook = create :cookbook
      get :show, id: cookbook.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders new view" do
      user = create :user
      session[:user_id] = user.id
      get :new, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "after good create, redirects to dashboard view" do
      user = create :user
      params = { user_id: user.id, cookbook: { name: "yikes", user_id: user.id } }
      session[:user_id] = user.id
      post :create, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "after bad create, renders new view" do
      user = create :user
      params = { user_id: user.id, cookbook: { name: nil, user_id: user.id } }
      session[:user_id] = user.id
      post :create, params

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "renders edit view" do
      user = create :user
      cookbook = create :cookbook, user_id: user.id
      session[:user_id] = user.id
      get :edit, user_id: user.id, id: cookbook.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it "after good update, redirects to dashboard view" do
      user = create :user
      cookbook = create :cookbook, id: 1, name: "nah", user_id: user.id
      params = { user_id: user.id, id: cookbook.id, cookbook: { name: "nope", user_id: user.id } }
      session[:user_id] = user.id
      put :update, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "after bad update, renders new view" do
      user = create :user
      cookbook = create :cookbook, id: 1, name: "lol", user_id: user.id
      params = { user_id: user.id, id: cookbook.id, cookbook: { name: nil, user_id: user.id } }
      session[:user_id] = user.id
      put :update, params

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "redirects to dashboard view" do
      user = create :user
      session[:user_id] = user.id
      cookbook = create :cookbook, user_id: user.id

      delete :destroy, id: cookbook.id, user_id: user.id

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end
  end

  describe "DELETE #destroy_recipe_assoc" do
    it "redirects to user cookbook show view" do
      user = create :user
      session[:user_id] = user.id
      ingredient = create :ingredient
      recipe = create :recipe, user_id: user.id, ingredient_ids: [ingredient.id]
      cookbook = create :cookbook, user_id: user.id
      cookbook.recipes << recipe

      delete :destroy_recipe_assoc, user_id: user.id, cookbook_id: cookbook.id, recipe_id: recipe.id

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_cookbook_path(user, cookbook))
    end
  end

end
