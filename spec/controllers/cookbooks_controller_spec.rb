require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  describe "GET #show" do
    context "logged in user" do
      before :each do
        cookbook = create :cookbook
        user = create :user
        session[:user_id] = user.id
        get :show, user_id: user.id, id: cookbook.id
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show view" do
        expect(response).to render_template("show")
      end
    end

    context "not logged in user" do
      before :each do
        user = create :user
        session[:user_id] = user.id
        # below references a different user
        get :show, user_id: 2
      end

      it "does not respond successfully" do
        expect(response).to_not be_success
      end

      it "redirects to the home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "GET #new" do
    context "logged in user" do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: user.id
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the new view" do
        expect(response).to render_template("new")
      end
    end

    context "not logged in user" do
      before :each do
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: 2
      end

      it "does not respond successfully" do
        expect(response).to_not be_success
      end

      it "redirects to the home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  # TODO: write these tests
  describe "POST #create" do
    describe "user not logged in" do
      it "redirects to " do
        create :user
        post :create, user_id: 2, cookbook: attributes_for(:cookbook)
        expect(response).to redirect_to(root_path)
      end
    end

    describe "user logged in" do
      context "valid cookbook params" do
        pending
      end

      context "invalid cookbook params" do
        pending
      end
    end
  end

  describe "GET #edit" do
    pending
  end

  describe "PATCH #update" do
    pending
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

    it "redirects to users#show" do
      delete :destroy,  user_id: @user.id, id: @cookbook.id
      expect(response).to redirect_to user_path(session[:user_id])
    end

    it "does not delete associated recipes" do
      recipe1 = create :recipe
      recipe2 = create :recipe, name: "Another Recipe"
      @cookbook.recipes << [ recipe1, recipe2 ]

      delete :destroy, user_id: @user.id, id: @cookbook.id
      expect(Recipe.all).to include(recipe1)
      expect(Recipe.all).to include(recipe2)
    end
  end
end
