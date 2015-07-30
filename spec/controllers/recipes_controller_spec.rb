require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    before :each do
      %w(Happy Lovely Pig Darling Appetite Bumpkin).each do |name|
        create(:recipe, name: name)
      end
    end

    it "instantiates a variable that is all the recipes in alpha_order" do
      get :index

      expect(assigns(:recipes).first.name).to eq "Appetite"
    end

    it "renders the recipes#index view" do
      get :index

      expect(response.status).to eq 200
      expect(subject).to render_template :index
    end
  end

  describe "GET #show" do
    context "not logged in user" do
      let(:recipe) { create(:recipe) }

      it "renders the show page" do
        get :show, id: recipe.id

        expect(response.status).to eq 200
        expect(subject).to render_template :show
      end

      it "instantiates a variable to store the recipe" do
        get :show, id: recipe.id

        expect(assigns(:recipe).id).to eq 1
      end
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "makes a new recipe" do
      expect(assigns(:recipe)).to be_a Recipe
    end

    it "renders the form" do
      expect(response.status).to eq 200
      expect(subject).to render_template :new
    end
  end

  describe "POST #create" do
    context "no name" do
      before :each do
        post :create, recipe: attributes_for(:recipe, name: "")
      end

      it "does not save to the db" do
        expect(Recipe.all.count).to eq 0
      end

      it "renders the form again" do
        expect(subject).to render_template :new
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:new_recipe_error])
      end
    end

    context "no preparation" do
      before :each do
        post :create, recipe: attributes_for(:recipe, preparation: "")
      end

      it "does not save to the db" do
        expect(Recipe.all.count).to eq 0
      end

      it "renders the form again" do
        expect(subject).to render_template :new
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:new_recipe_error])
      end
    end

    context "valid recipe" do
      before :each do
        post :create, recipe: attributes_for(:recipe)
        @recipe = Recipe.find(1)
      end

      it "saves the recipe to the db" do
        expect(Recipe.all.count).to eq 1
      end

      it "is associated with the correct user" do
        user = create(:user)

        expect(@recipe.user.id).to eq user.id
      end

      it "redirects_to the show page" do
        expect(subject).to redirect_to recipe_path(id: @recipe.id)
      end
    end
  end

  describe "GET #edit" do
    before :each do
      user = create(:user)
      session[:user_id] = user.id
      @recipe = create(:recipe)
      get :edit, id: @recipe.id
    end

    it "renders the edit form" do
      expect(response.status).to eq 200
      expect(subject).to render_template :edit
    end

    context "unauthorized user cannot edit" do
      before :each do
        @unauth_user = create(:user, username: "user2")
        session[:user_id] = @unauth_user.id

        get :edit, id: @recipe.id
      end

      it "redirects to the user's dashboard" do
        expect(subject).to redirect_to user_path(id: @unauth_user.id)
      end

      it "flashes an error" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:unauth_user_error])
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @user = create(:user)
      @recipe = create(:recipe)
    end

    context "valid user" do
      before :each do
        session[:user_id] = @user.id
      end

      context "no name" do
        before :each do
          put :update, id: @recipe.id, recipe: attributes_for(:recipe, name: "")
        end

        it "does not make the change" do
          expect(@recipe.name).to eq "Delicious Food"
        end

        it "renders to the edit form" do
          expect(subject).to render_template :edit
        end
      end

      context "no preparation" do
        before :each do
          put :update, id: @recipe.id, recipe: attributes_for(:recipe, preparation: "")
        end

        it "does not make the change" do
          expect(@recipe.name).to eq "Delicious Food"
        end

        it "renders to the edit form" do
          expect(subject).to render_template :edit
        end
      end

      context "valid edit" do
        before :each do
          put :update, id: @recipe.id, recipe: attributes_for(:recipe, name: "Howdy")
          @recipe.reload
        end

        it "saves the updates" do
          expect(@recipe.name).to eq "Howdy"
        end

        it "redirects to the recipe's show page" do
          expect(subject).to redirect_to recipe_path(id: @recipe.id)
        end
      end
    end

    context "not the right user" do
      before :each do
        session[:user_id] = nil
        put :update, id: @recipe.id, recipe: attributes_for(:recipe, name: "Howdy")
      end

      it "doesn't update the record" do
        expect(@recipe.name).to eq "Delicious Food"
      end

      it "flashes an error" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:unauth_user_error])
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      user = create(:user)
      recipe = create(:recipe)
      session[:user_id] = user.id
      delete :destroy, id: recipe.id
    end

    it "deletes the record" do
      expect(Recipe.all.count).to eq 0
    end
  end
end
