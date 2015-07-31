require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  let(:cookbook) {create :cookbook}

  describe "GET #show" do
    it "renders the :show view for a cookbook" do
       get :show, user_id: 1, id: cookbook.id
       expect(response).to render_template("show")
    end
  end

  describe "PATCH #remove_recipe" do
    before :each do
      @cookbook = create :cookbook
      @recipe1 = create :recipe
      @recipe2 = create :recipe

      @cookbook.recipes << @recipe1
      @cookbook.recipes << @recipe2
    end

    it "removes a recipe from a cookbook" do
      patch :remove_recipe, user_id: @cookbook.user_id, cookbook_id: @cookbook.id, recipe_id: @recipe1.id
      expect(@cookbook.recipes.count).to eq 1
    end

    it "does not delete the recipe record" do
      patch :remove_recipe, user_id: @cookbook.user_id, cookbook_id: @cookbook.id, recipe_id: @recipe1.id
      expect(Recipe.count).to eq 2
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      @user = create :user
      session[:user_id] = @user.id
      get :new, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

     it "creates a new Cookbook object" do
       session[:user_id] = create(:user)
       get :new, user_id: session[:user_id]
       expect(assigns(:cookbook)).to be_kind_of(Object)
     end
   end

   describe "DELETE #destroy" do
    before :each do
      @cookbook = create :cookbook
      @user = create :user
      session[:user_id] = @user.id
    end

    it "deletes the record" do
      delete :destroy, user_id: @user.id, id: @cookbook.id
      expect(Cookbook.count).to eq 0
    end
  end
end
