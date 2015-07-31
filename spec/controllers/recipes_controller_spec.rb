require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before :each do
    create :ingredient, id: 99
    create :recipe, id: 1,  user_id: 1
  end


  describe "GET #new" do
    it "renders the :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to render_template("new")
    end
  end

  let(:recipe) do
      {
        user_id: 1,

      }
    end

  describe "POST #create" do
    it "redirects to the dashboard view" do
      user = create :user
      params = {user_id: user.id,
        recipe: {
        name: "A recipe",
        description: "Do stuff",
        preparation: "Prepare stuff",
        ingredient_ids: [99]
        }
      }
      session[:user_id] = 1
      post :create, params

      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "has a flash error for invalid data" do
      user = create :user
      session[:user_id] = user.id
        post :create, { user_id: user.id,
          recipe: {
          name: nil,
          description: "Do stuff",
          preparation: "Prepare stuff",
          ingredient_ids: [99]
          }
        }

      expect(flash[:error]).to eq("Please enter valid stuff")
    end
  end

  describe "GET #show" do
    it "renders the :show view" do
      user = create :user, name: "bob"
      ingredient = create :ingredient, name: "wimpy pasta"
      recipe = create :recipe, user_id: user.id, ingredient_ids: [ingredient.id]

      get :show, id: recipe.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it "still renders :show for that user's recipe" do
      user = create :user, name: "bob"
      ingredient = create :ingredient, name: "wimpy pasta"
      recipe = create :recipe, user_id: user.id, ingredient_ids: [ingredient.id]
      session[:user_id] = user.id

      get :show, id: recipe.id, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "renders the :edit view" do
      user = create :user, name: "sue"
      recipe = create :recipe, user_id: user.id, ingredient_ids: [99]
      session[:user_id] = user.id

      get :edit, id: recipe.id, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it "after good update, redirects to :dashboard view" do
      user = create :user, name: "sue"
      recipe = create :recipe, user_id: user.id, ingredient_ids: [99]
      params = {id: recipe.id, user_id: user.id, recipe: {name: "stinky cheese", user_id: user.id, ingredient_ids: [99]}}
      session[:user_id] = user.id

      put :update, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
    end

    it "after bad update, flashes error and redirect to :dashboard view" do
      user = create :user, name: "sue"
      recipe = create :recipe, user_id: user.id, ingredient_ids: [99]
      params = {id: recipe.id, user_id: user.id, recipe: {name: nil, user_id: user.id, ingredient_ids: [99]}}
      session[:user_id] = user.id

      put :update, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(user))
      expect(flash[:error]).to eq("Please enter valid stuff")
    end
  end


end
