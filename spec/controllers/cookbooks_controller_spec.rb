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

    it "renders the index template" do
      get :index

      expect(subject).to render_template :index
    end

    it "renders only the cookbooks for the logged in user" do
      get :index

      expect(assigns(:cookbooks).count).to eq 1
      expect(assigns(:cookbooks)).to eq(User.first.cookbooks)
    end
  end

  describe "#show" do
    before :each do
      @cookbook_a = create(:cookbook)
      session[:user_id] = User.first.id
      2.times {
        recipe = create(:recipe)
        @cookbook_a.recipes << recipe
      }

      get :show, id: @cookbook_a
    end

    it "renders the show template" do
      expect(subject).to render_template :show
    end

    it "render the info for the specific cookbook" do
      expect(assigns(:cookbook)).to eq(Cookbook.first)
    end

    it "renders the list of recipes for the specific cookbook" do
      expect(assigns(:recipes).count).to eq 2
      expect(assigns(:recipes)).to eq(Cookbook.first.recipes)
    end
  end

  describe "#new" do
    it "renders the new template" do
      create(:user)
      session[:user_id] = User.first.id
      get :new

      expect(subject).to render_template :new
    end
  end

  describe "#create" do
    before :each do
      create(:user)
      session[:user_id] = User.first.id
    end

    context "valid user params" do
      it "creates a cookbook" do
        post :create, { cookbook: attributes_for(:cookbook, user: User.first.id) }
        expect(Cookbook.count).to eq 1
      end
    end

    context "invalid user params" do
      let (:invalid) { { cookbook: attributes_for(:cookbook, name: "", user: User.first.id) } }

      it "does not create a cookbook" do
        post :create, invalid
        expect(Cookbook.count).to eq 0
      end

      it "renders the new cookbook page (if unsuccessful save)" do
        post :create, invalid
        expect(subject).to render_template(:new)
      end
    end
  end

  # # STILL NEED TO WRITE:
  # describe "#edit" do
  # end
  #
  # describe "#update" do
  # end
  #
  # describe "#destroy" do
  # end

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
      end

      it "removes the association" do
        expect(@cookbook.recipes.count).to eq 1
      end

      it "doesn't delete the recipe" do
        expect(Recipe.all.count).to eq 2
        expect(Recipe.find(@recipe.id)).to eq(@recipe)
      end

      it "will redirect to the cookbook's show page" do
        expect(subject).to redirect_to(cookbook_path(@cookbook))
      end
    end

    context "between all recipes & the cookbook" do
      before :each do
        post :remove_recipe, id: @cookbook
      end

      it "removes the associations" do
        expect(@cookbook.recipes.count).to eq 0
      end

      it "doesn't delete the recipes" do
        expect(Recipe.all.count).to eq 2
      end

      it "will redirect to the cookbook's show page" do
        expect(subject).to redirect_to(cookbook_path(@cookbook))
      end
    end
  end
end
