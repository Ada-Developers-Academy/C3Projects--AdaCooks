require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before :each do
    ingredient = create :ingredient, id: 99
    recipe = create :recipe, id: 1,  user_id: 1

  end


  describe "GET #new" do
    it "renders the :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to render_template("new")
    end
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

end
