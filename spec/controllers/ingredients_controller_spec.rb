require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to render_template("new")
    end
  end



  describe "GET #new" do
    it "renders :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "after good create, redirects to :dashboard view" do
      user = create :user
      params = { user_id: user.id, ingredient: { name: "moist basil", user_id: user.id } }
      session[:user_id] = user.id

      post :create, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "after bad create, flashes error and redirect to :dashboard view" do
        user = create :user
        params = { user_id: user.id, ingredient: { name: nil, user_id: user.id } }
        session[:user_id] = user.id
        request.env['HTTP_REFERER'] = '/users/#{user.id}/dashboard'
        post :create, params

        expect(response).to have_http_status(302)
        expect(response).to redirect_to('/users/#{user.id}/dashboard')
        expect(flash[:error]).to eq("Please enter valid stuff")
      end
  end

  describe "GET #index" do
    it "renders :index view" do
      user = create :user
      session[:user_id] = user.id

      get :index, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #edit" do
    it "renders :edit view" do
      user = create :user
      ingredient = create :ingredient
      session[:user_id] = user.id

      get :edit, user_id: user.id, id: ingredient.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)

    end
  end

  describe "PUT #update" do
    it "after good update, redirects to :dashboard view" do
      user = create :user
      session[:user_id] = user.id
      ingredient = create :ingredient, user_id: user.id
      params = { id: ingredient.id, user_id: user.id, ingredient: { id: ingredient.id, user_id: user.id } }

      put :update, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "after bad update, flashes error and redirects to :dashboard view" do
      user = create :user
      session[:user_id] = user.id
      ingredient = create :ingredient, user_id: user.id
      params = { id: ingredient.id, user_id: user.id, ingredient: { id: ingredient.id, name: nil, user_id: user.id } }
      request.env['HTTP_REFERER'] = '/users/#{user.id}/dashboard'

      put :update, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to('/users/#{user.id}/dashboard')
      expect(flash[:error]).to eq("Please enter valid stuff")
    end
  end

  describe "GET #show" do
    it "renders :show view" do
      ingredient = create :ingredient

      get :show, id: ingredient.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "DELETE #destroy" do
    it "redirects to :dashboard view" do
      user = create :user
      session[:user_id] = user.id
      ingredient = create :ingredient, user_id: user.id

      delete :destroy, id: ingredient.id, user_id: user.id

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(user_ingredients_path(user))
    end
  end
end
