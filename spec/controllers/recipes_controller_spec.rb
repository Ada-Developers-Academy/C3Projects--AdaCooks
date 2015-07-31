require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    let(:recipe_params) do
      {
        recipe: {
          name: "Yay",
          preparation: "Yup",
          ingredient_ids: 2,
          user_id: 1
        }
      }
    end

    it "renders the index template" do
      get :index, recipe_params
      expect(response).to render_template("index")
    end

    # it "loads all recipes into @recipes" do
    #   recipe = build :recipe
    #   all_recipes = [recipe, recipe2]
    #   get :index
    #   expect(all_recipes.count).to eq 2
    # end
  end

  describe "GET #show" do
    let(:recipe_params) do
      {
        recipe: {
          name: "Yay",
          preparation: "Yup",
          ingredient_ids: 2,
          user_id: 1
        }
      }
    end
  # let(:soup) {create :recipe, user: create(:user) } # associated a user with a recipe: there's a user hash, create method has user paramater
    it "renders the :show view" do
      get :show, recipe_params
      expect(response).to render_template("show")
    end

    it "returns successfully with HTTP code of 200" do
      get :show, recipe_params
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
    let(:recipe_params) do
      {
        recipe: {
          name: "Yay",
          preparation: "Yup",
          ingredient_ids: 2,
          user_id: 1
        }
      }
    end

    it "renders the new template" do
      session[:user_id] = create(:user)
      get :new, :id => session[:user_id]
      expect(response).to render_template("new")
    end

    it "creates a new Recipe object" do
      session[:user_id] = create(:user)
      get :new, recipe_params
      expect(assigns(:recipe)).to be_kind_of(Object)
    end
  end

  describe "POST #create" do

    context " Ingredient params" do
      let(:recipe_params) do
        {
          recipe: {
            name: "Yay",
            preparation: "Yup",
            ingredient_ids: 2,
            user_id: 1
          }
        }
      end

      it "creates a new recipe" do
        session[:user_id] = create(:user)
        post :create, recipe_params
        expect(Recipe.count).to be(1)
        expect(response).to redirect_to(user_path(session[:user_id]))
      end
    end
  end


  describe "DELETE #destroy" do
    let(:recipe_params) do
      {
        recipe: {
          name: "Yay",
          preparation: "Yup",
          ingredient_ids: 2,
          user_id: 1
        }
      }
    end

    it "ingredient count changes by -1" do
      session[:user_id] = create(:user)
      delete :destroy, recipe_params
      expect(Recipe).to change(Recipe, :count).by(-1)
    end

  end

end
