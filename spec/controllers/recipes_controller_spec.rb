require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  before :each do
    ingredient = create :ingredient, id: 99
    @user = create :user, id: 1
    recipe = create :recipe, id: 1,  user_id: 1

    session[:user_id] = "1"
  end

  let(:recipe_params) do
      {
        user_id: 1
      }
    end



  describe "GET #new" do
    it "renders the :new view" do
      get :new, recipe_params

      expect(response).to render_template("new")
    end
  end

  let(:recipe) do
      {
        user_id: 1,
        recipe: {
        name: "A recipe",
        description: "Do stuff",
        preparation: "Prepare stuff",
        ingredient_ids: [99]
        }
      }
    end

  describe "POST #create" do
    it "redirects to the dashboard view" do
      post :create, recipe

      expect(response).to redirect_to(dashboard_user_path(@user.id))
    end
  end
end
