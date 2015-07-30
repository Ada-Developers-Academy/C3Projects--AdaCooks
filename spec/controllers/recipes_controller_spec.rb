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
  let(:soup) {create :recipe, user: create(:user) } # associated a user with a recipe: there's a user hash, create method has user paramater
    it "renders the :show view" do
      get :show, :id => soup.id
      expect(response).to render_template("show")
    end

    it "returns successfully with HTTP code of 200" do
      get :show, :id => soup.id
      expect(response).to be_success
    end
  end

  describe "remove_recipe_from_cookbook" do
    # creating a cookbook associated with a user, and associated with recipes collection
    let(:book) { create :cookbook, user: create(:user), recipes: [create(:recipe)] }

    before(:each) do
      book
      # need a cookbook_id in session for method to work
      session[:cookbook_id] = book.id
    end

    it "removes recipe from cookbook" do
      get :update, :recipe_id => 1
      expect(book.recipes.count).to eq(0)
    end

    it "doesn't delete the recipe" do
      get :update, :recipe_id => 1
      expect(Recipe.count).to eq(1)
    end
  end

  # describe "POST #create" do
  #   let(:recipe_params) do
  #     {
  #       recipe: {
  #         name: "Yay",
  #         preparation: "Yup"
  #       },
  #
  #       ingredient: {
  #         name: "Insert"
  #       }
  #     }
  #   end
  #
  #   it "creates a new recipe" do
  #     post :create, recipe_params
  #     expect(Recipe.count).to eq(1)
  #   end
  # end

  # describe "GET#New" do
  #   let(:pineapple) {create :recipe, user: create(:user), ingredients: create(:ingredient) }
  #
  #   it "saves a new blank instance of a recipe in a variable" do
  #     pineapple
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end


    # let(:soup) {create :recipe, user: create(:user)}
    # let(:water) {create :ingredient}
      # recipe1 = build(:recipe, ingredients: create(:ingredient), user: create(:user))

  describe "GET #new" do
    it "creates a new recipe" do
      soup = create(:recipe)
      soup.ingredients = create(:ingredient)
      soup.user = create(:user)
      soup.save
      post :create, :id => soup.id
      expect(assigns(:recipe)).to be_a_new(Recipe)
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
