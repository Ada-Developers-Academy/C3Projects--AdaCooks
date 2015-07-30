require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    let(:recipe2) { create :recipe, name: "Cream" }

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all recipes into @recipes" do
      recipe = build :recipe
      all_recipes = [recipe, recipe2]
      get :index
      expect(all_recipes.count).to eq 2
    end
  end

  describe "GET #show" do
  let(:pineapple) {create :recipe, user: create(:user) }
    it "renders the :show view" do

      get :show, :id => pineapple.id
      expect(response).to render_template("show")
    end

    it "returns successfully with HTTP code of 200" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    let(:pineapple) {create :recipe, user: create(:user) }

    it "creates a new recipe" do
      ingredient = build :ingredient
      pineapple.ingredients << ingredient

      get :new
      expect(assigns(:pineapple)).to be_a_new(Recipe)
      expect(response).to render_template(:new)
    end
  end # new

  # describe "POST #create" do
  #   # + test case
  #   context "Valid Ingredient params" do
  #     let(:ingred_params) do
  #        {
  #          ingredient: {
  #            name: 'Steak',
  #            image: 'steak.jpg'
  #          }
  #        }
  #     end
  #
  #     it "creates a new Ingredient record" do
  #       post :create, ingred_params
  #       expect(Ingredient.count).to eq(1)
  #     end
  #   end
  #   # - test case
  #   context "Invalid Ingredient params" do
  #     let(:ingred_params) do
  #        {
  #          ingredient: {
  #            image: 'steak.jpg'
  #          }
  #        }
  #     end
  #
  #     it "does not persist invalid ingredients" do
  #      post :create, ingred_params
  #      expect(Ingredient.count).to eq 0
  #      end
  #
  #    it "renders the :new view (to allow users to fix invalid data)" do
  #      post :create, ingred_params
  #      expect(response).to render_template("new")
  #    end
  #
  #   end
  # end # create
  #
  # describe "DELETE #destroy" do
  #   before(:each) do
  #     @pine = create :ingredient
  #     @pop = create :ingredient, name: "PopTarts"
  #   end
  #
  #   it "ingredient count changes by -1" do
  #     expect{delete :destroy, {id: @pine.id}}.to change(Ingredient, :count).by(-1)
  #   end
  #
  #   it "redirect_to root_path" do
  #     delete :destroy, id: @pine.id
  #     expect(response).to redirect_to(root_path)
  #   end
   # destroy

end # describe
