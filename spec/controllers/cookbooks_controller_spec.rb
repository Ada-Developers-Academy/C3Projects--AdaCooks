require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    let(:book) {create :cookbook}

    it "returns successfully with HTTP code of 200" do
      get :show, id: book
      expect(response).to be_success
    end

    it "renders the :show view" do
      get :show, id: book
      expect(response).to render_template(:show)
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
    before(:each) do
      session[:user_id] = 10
      create :cookbook
    end

    it "cookbook count changes by -1" do
      expect{delete :destroy, {id: cookbook.id}}.to change(Cookbook, :count).by(-1)
    end

    it "redirect_to user_path" do
      delete :destroy, id: cookbook.id
      expect(response).to redirect_to(user_path(session[:user_id]))
    end
  end

end
