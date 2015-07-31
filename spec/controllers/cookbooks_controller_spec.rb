require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  before :each do
    @user = create :user
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the new template" do
      expect(response).to render_template "new" 
    end
  end

  describe "POST #create" do
    context "valid params" do
      let(:valid_params) do
        { name: "a name", description: "a description" }
      end

      before :each do
        session[:user_id] = @user.id
        post :create, cookbook: valid_params
      end

      it "creates a new cookbook" do
        expect(Cookbook.count).to eq 1
      end

      it "redirects to the new cookbook #show" do
        expect(response).to redirect_to cookbook_path(Cookbook.first)
      end
    end

    context "invalid params" do
      let(:invalid_params) do
        { name: nil, description: "a description" } # missing name
      end

      before :each do
        post :create, cookbook: invalid_params
      end

      it "does not create a new cookbook" do
        expect(Cookbook.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    let(:cookbook) { create :cookbook }

    before :each do
      session[:user_id] = cookbook.user.id
      get :edit, id: cookbook
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the edit template" do
      expect(response).to render_template "edit"
    end
  end

  describe "PUT #update" do
    let(:cookbook) { create :cookbook }

    context "valid params" do
      before :each do
        session[:user_id] = cookbook.user.id
        put :update, id: cookbook, cookbook: { 
          name: 'updated name', description: 'updated description'
        }
        cookbook.reload
      end

      it "updates an cookbook with valid params" do
        expect(cookbook.name).to eq "updated name"
      end

      it "redirects to cookbook#show" do
        expect(response).to redirect_to cookbook_path(cookbook)        
      end
    end

    context "invalid params" do # missing name
      before :each do
        session[:user_id] = cookbook.user.id
        put :update, id: cookbook, cookbook: {
          name: nil, description: 'updated description'
        }
        cookbook.reload
      end

      it "does not update a cookbook with invalid params" do
        expect(cookbook.description).to_not eq "updated description"
      end

      it "renders the :edit template" do
        expect(response).to render_template "edit"
      end
    end
  end

  describe "GET #show" do
    let(:cookbook) { create :cookbook }

    before :each do
      session[:user_id] = cookbook.user.id
      get :show, id: cookbook
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the show template" do
      expect(response).to render_template "show"
    end
  end

  describe "DELETE #destroy" do
    let(:cookbook) { create :cookbook }

    before :each do
      recipe = create :recipe
      cookbook.recipes << recipe
      delete :destroy, id: cookbook
    end

    it "deletes the cookbook" do
      expect(Cookbook.count).to eq 0
    end

    # the recipes are not deleted
    it "does not delete the associated recipes" do
      expect(Recipe.count).to eq 1
    end

    # uncomment when the user show is created
    # it "redirects to the user show page" do
    #   expect(response).to redirect_to user_path(cookbook.user)
    # end
  end

  describe "DELETE #remove_recipe" do
    let(:cookbook) { create :cookbook }
    before :each do
      recipe = create :recipe
      cookbook.recipes << recipe
      delete :remove_recipe, cookbook_id: cookbook, id: recipe
    end

    it "removes the association between cookbook and recipe" do
      expect(cookbook.recipes.count).to eq 0
    end
  end
end
