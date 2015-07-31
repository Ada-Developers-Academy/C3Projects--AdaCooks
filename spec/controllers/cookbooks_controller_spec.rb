require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    let(:book) {create :cookbook}

    it "returns successfully with HTTP code of 200" do
      session[:cookbook_id] = book.id
      get :show, id: book
      # why is this returning false?
      expect(response).to be_success
    end

    it "renders the :show view" do
      session[:cookbook_id] = book.id
      get :show, id: book
      # why is it rendering with <[]> instead of <"show">?
      expect(response).to render_template(:show)
    end

    it "finds the right cookbook" do
      get :show, id: book
      expect{assigns(book).to eq(Cookbook)}
    end

    # - test case

    it "does not display someone else's cookbook" do
      get :show, id: book
      expect(flash[:error]).to be_present
    end
  end

  describe "GET #new" do
    let(:book) {create :cookbook}

    it "creates a new cookbook" do
      get :new
      expect(assigns(:cookbook)).to be_a_new(Cookbook)
      expect(response).to render_template(:new)
    end
  end # new

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

  describe "DELETE #destroy" do
    # let(:cookbook) { create :cookbook, user: create(:user), recipes: [create(:recipe)] }

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
