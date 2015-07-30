require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "#index" do
    before :each do
      2.times { create(:cookbook) }
      session[:user_id] = User.first.id
    end

    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #new template" do
      get :index

      expect(subject).to render_template :index
    end

    it "renders only the cookbooks for the logged in user" do
      get :index

      expect(assigns(:cookbooks).count).to eq 1
      expect(assigns(:cookbooks)).to eq(User.first.cookbooks)
    end
  end

  describe "#remove_recipe" do
    before :each do
      @cookbook = create(:cookbook)
      session[:user_id] = User.first.id
      @recipe = create(:recipe)
      @cookbook.recipes << @recipe
      @cookbook.recipes << create(:recipe)
    end

    context "between a single recipe & the cookbook" do
      before :each do
        post :remove_recipe, { id: @cookbook, recipe: @recipe }
        # @recipe = @cookbook.recipes.first
        # @cookbook.recipes.destroy(@recipe)
      end

      it "removes the association" do
        expect(@cookbook.recipes.count).to eq 1
      end

      it "doesn't delete the recipe" do
        expect(Recipe.all.count).to eq 2
        expect(Recipe.find(@recipe.id)).to eq(@recipe)
      end
    end

    context "between all recipes & the cookbook" do
      before :each do
        @cookbook.recipes.destroy_all
      end

      it "removes the associations" do
        expect(@cookbook.recipes.count).to eq 0
      end

      it "doesn't delete the recipes" do
        expect(Recipe.all.count).to eq 2
      end
    end

    it "will redirect to the cookbook's show page" do
      post :remove_recipe, { id: @cookbook, recipe: @recipe }

      expect(subject).to redirect_to(cookbook_path(@cookbook))
    end
  end

  #
  #   let(:cookbook_a) { create(:cookbook, name: "a") }
  #   let(:recipe_b) { create(:recipe, name: "b") }
  #   let(:recipe_c) { create(:recipe, name: "c") }
  #
  #   it "assigns all recipes to @recipes" do
  #     5.times { create(:recipe) }
  #
  #     get :index
  #
  #     expect(assigns(:recipes).count).to eq(5)
  #   end
  #
  #   it "assigns @recipes in alphabetical order" do
  #     recipe_b # need to create the records in the db out of alphabetical order
  #     recipe_order = [ recipe_a, recipe_b, recipe_c ]
  #
  #     get :index
  #
  #     expect(assigns(:recipes).count).to eq(3)
  #     expect(assigns(:recipes)).to eq(recipe_order)
  #   end
  #
  #   it "renders the index template" do
  #     get :index
  #
  #     expect(response).to render_template("index")
  #   end
  # end
  #
  # describe "get :show" do
  #   let(:recipe) { create(:recipe) }
  #
  #   it "assigns @recipe" do
  #     get :show, { id: recipe.id }
  #
  #     expect(assigns(:recipe)).to eq(recipe)
  #   end
  #
  #   it "renders the show template" do
  #     get :show, { id: recipe.id }
  #
  #     expect(response).to render_template("show")
  #   end
  # end
  #
  #
  #
  #   def index
  #     @cookbooks = Cookbook.by_user(session[:user_id]) # TODO SHOULD BE ALPHABETICAL?
  #   end
  #
  #   def show
  #     @recipes = @cookbook.recipes
  #   end
  #
  #   def new
  #     @cookbook = Cookbook.new
  #   end
  #
  #   def create
  #     @cookbook = Cookbook.new(cookbook_params)
  #     @cookbook.user_id = session[:user_id]
  #     if @cookbook.save
  #       flash[:success] = MESSAGES[:saved]
  #       redirect_to cookbook_path(@cookbook)
  #     else
  #       flash[:warning] = MESSAGES[:name]
  #       render :new
  #     end
  #   end
  #
  #   def edit
  #   end
  #
  #   def update
  #     if @cookbook.update(cookbook_params)
  #       flash[:success] = MESSAGES[:saved]
  #       redirect_to cookbook_path(@cookbook)
  #     else
  #       # BELOW: Had to do the below because @cookbook's values still change
  #       # from the #update mehod, and I want to return the original name.
  #       @cookbook.name = Cookbook.find(params[:id]).name
  #       flash.now[:warning] = MESSAGES[:name]
  #       render :edit
  #     end
  #   end
  #
  #   def destroy
  #     @cookbook.destroy
  #     redirect_to cookbooks_path
  #   end
  #
  #   def remove_recipe
  #     if params[:recipe].nil?
  #       @cookbook.recipes.destroy_all
  #     else
  #       recipe = Recipe.find(params[:recipe])
  #       @cookbook.recipes.destroy(recipe)
  #     end
  #     flash.now[:success] = MESSAGES[:recipe]
  #     redirect_to cookbook_path(@cookbook)
  #   end
end
