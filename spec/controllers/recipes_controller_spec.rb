require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all recipes into @recipes" do
      recipe1 = create :recipe, name: "tacos"
      recipe2 = create :recipe, name: "pizza"
      get :index
      expect(assigns(:recipes)).to match_array([recipe1, recipe2])
    end
  end
end
