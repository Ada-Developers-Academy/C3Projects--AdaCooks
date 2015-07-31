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
  end

  describe "GET #show" do

    before(:each) do
      @soup = create :recipe, ingredients: [create(:ingredient)], user: create(:user)
    end

    it "returns successfully with HTTP code of 200" do
      get :show, id: @soup
      expect(response).to be_success
    end

    it "renders the :show view" do
      get :show, id: @soup
      expect(response).to render_template(:show)
    end
  end

  describe "GET #remove_recipe" do
    # creating a cookbook associated with a user, and associated with recipes collection
    # let(:book) { create :cookbook, user: create(:user), recipes: [create(:recipe)] }

    before(:each) do
      soup = create :recipe, ingredients: [create(:ingredient)]
      @book = create :cookbook, user: create(:user), recipes: [soup]
      # need a cookbook_id in session for method to work
      session[:cookbook_id] = @book.id
    end

    it "removes recipe from cookbook" do
      get :remove_recipe, :recipe_id => 1
      expect(@book.recipes.count).to eq(0)
    end

    it "doesn't delete the recipe" do
      get :remove_recipe, :recipe_id => 1
      expect(Recipe.count).to eq(1)
    end
  end

  describe "GET #new" do
    let(:recipe_params) do
      {
        recipe: {
          name: "Yay",
          preparation: "Yup",
          :ingredient_ids => [2],
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

    before :each do
      user = create :user, id: 2
      session[:user_id] = 2
      ingredient = create(:ingredient)
    end

    context "valid params" do
      let (:recipe_params) do
        {
          name: "Yay",
          preparation: "yup",
          user_id: 2,
          :ingredient_ids => [1]
          }
      end

      it "creates a new Recipe record" do
        post :create, recipe: recipe_params
        expect(Recipe.count).to eq(1)
      end
    end

    context "with invalid recipe params" do
      let (:invalid_recipe_params) do
        {
          name: "Some Name",
          user_id: 2 }
        end

      it "doesn't create a new recipe" do
        post :create, :recipe => invalid_recipe_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    # + test case
    context "it's the user's recipe" do
      before(:each) do
        @soup = create :recipe, ingredients: [create(:ingredient)], user: create(:user)
        session[:user_id] = @soup.user_id
      end

      it "renders the edit page" do
        get :edit, id: @soup
        expect(response).to render_template(:edit)
      end
    end
    # - test case
    context "it's not user's recipe" do
      before(:each) do
        @soup = create :recipe, ingredients: [create(:ingredient)], user: create(:user)
        session[:user_id] != @soup.user_id
      end

      it "redirect_to recipe_path" do
        get :edit, id: @soup
        expect(response).to redirect_to(recipe_path(@soup))
        # undefined method `user_id' for nil:NilClass??
      end
    end
  end

  describe "PATCH #update" do
    context "sucessful update" do
      before(:each) do
        @soup = create :recipe, ingredients: [create(:ingredient)], user: create(:user)
        session[:user_id] = @soup.user_id
      end

      it "changes recipe's name" do
        patch :update, :id => @soup, :recipe => {name: "EAT MOAR SOUPZ"}
        @soup.reload
        expect(@soup.name).to eq("EAT MOAR SOUPZ")
      end

      it "redirect_to user_path" do
        patch :update, id: @soup, :recipe => {name: "EAT MOAR SOUPZ"}
        expect(response).to redirect_to(user_path(@soup.user_id))
      end

    end
  end





  describe "DELETE #destroy" do

    before(:each) do
      @soup = create :recipe, ingredients: [create(:ingredient)], user: create(:user)
      session[:user_id] = @soup.user_id
    end

    it "ingredient count changes by -1" do
      delete :destroy, id: @soup
      expect(Recipe.count).to eq(0)
    end


  end



end
