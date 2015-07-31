require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    before(:each) do
      soup = create :recipe, ingredients: [create(:ingredient)]
      @cookbook = create :cookbook, user: create(:user), recipes: [soup]
      session[:user_id] = @cookbook.user_id
    end

    it "returns successfully with HTTP code of 200" do
      get :show, id: @cookbook
      # why is this returning false?
      expect(response).to be_success
    end

    it "renders the :show view" do
      get :show, id: @cookbook
      expect(response).to render_template(:show)
    end

    it "finds the right cookbook" do
      get :show, id: @cookbook
      expect{assigns(book).to eq(Cookbook)}
    end
  end

  describe "GET #new" do
    let(:book) {create :cookbook}

    it "creates a new cookbook" do
      get :new
      expect(assigns(:cookbook)).to be_a_new(Cookbook)
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    # + test case
      it "creates a new Cookbook record" do
        session[:user_id] = 20
        expect{post :create, cookbook: FactoryGirl.attributes_for(:cookbook)}.to change(Cookbook, :count).by(1)
      end
    # - test case
    context "doesn't let invalid cookbooks to save" do
      it "does not persist invalid ingredients" do
       session[:user_id] = 20

       expect{post :create, cookbook: FactoryGirl.attributes_for(:cookbook, name: nil)}.to change(Cookbook, :count).by(0)
       end

     it "renders the :new view (to allow users to fix invalid data)" do
       post :create, cookbook: FactoryGirl.attributes_for(:cookbook, name: nil)
       expect(response).to render_template("new")
     end

    end
  end # create

  describe "GET #edit" do
    # + test case
    context "it's the user's cookbook" do
      before(:each) do
        soup = create :recipe, ingredients: [create(:ingredient)]
        @cookbook = create :cookbook, user: create(:user), recipes: [soup]
        session[:user_id] = @cookbook.user_id
      end
      it "renders the edit page" do
        get :edit, id: @cookbook
        expect(response).to render_template(:edit)
      end
    end
    # - test case
    context "it's not user's cookbook" do
      before(:each) do
        soup = create :recipe, ingredients: [create(:ingredient)]
        @cookbook = create :cookbook, user: create(:user), recipes: [soup]
        session[:user_id] = 20
      end
      it "redirect_to user_path" do
        get :edit, id: @cookbook
        expect(response).to redirect_to(user_path(session[:user_id]))
        # undefined method `user_id' for nil:NilClass??
      end
    end
  end

  describe "PATCH #update" do
    context "sucessful update" do
      before(:each) do
        soup = create :recipe, ingredients: [create(:ingredient)]
        @cookbook = create :cookbook, user: create(:user), recipes: [soup]
        session[:user_id] = @cookbook.user_id
      end

      it "changes cookbook name" do
        patch :update, :id => @cookbook, :cookbook => {name: "Cookbookin'"}
        @cookbook.reload
        expect(@cookbook.name).to eq("Cookbookin'")
      end

      it "redirect_to user_path" do
        patch :update, id: @cookbook, :cookbook => {name: "Cookbookin'"}
        expect(response).to redirect_to(user_path(@cookbook.user_id))
      end

    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      soup = create :recipe, ingredients: [create(:ingredient)]
      @cookbook = create :cookbook, user: create(:user), recipes: [soup]
      session[:user_id] = @cookbook.user_id
    end

    it "cookbook count changes by -1" do
      expect{delete :destroy, {id: @cookbook}}.to change(Cookbook, :count).by(-1)
    end

    it "redirect_to user_path" do
      delete :destroy, id: @cookbook
      expect(response).to redirect_to(user_path(@cookbook.user_id))
    end

    it "doesn't delete the recipe" do
      delete :destroy, id: @cookbook
      expect(Recipe.count).to eq(1)
    end
  end


end
