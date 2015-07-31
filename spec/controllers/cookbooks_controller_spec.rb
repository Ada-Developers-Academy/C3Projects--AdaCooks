require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "Only logged in users can access their cookbooks" do
    context "Anonymous users are redirected to home" do
      before :each do
        @user = create :user
        @cookbook = create :cookbook
      end

      it "get #index redirects anonymous user to home" do
        get :index, user_id: @user.id

        expect(response).to redirect_to root_path
        expect(response).to have_http_status(302)
      end

      it "get #show redirects anonymous user to home" do
        get :show, user_id: @user.id, id: @cookbook.id

        expect(response).to redirect_to root_path
        expect(response).to have_http_status(302)
      end

      it "get #new redirects anonymous user to home" do
        get :new, user_id: @user.id

        expect(response).to redirect_to root_path
        expect(response).to have_http_status(302)
      end
    end

    context "Logged in users can access their pages" do
      before :each do
        @user = create :user
        session[:user_id] = @user.id
        @cookbook = create :cookbook
      end

      it "renders the #index view" do
        get :index, user_id: @user.id

        expect(response).to render_template("index")
      end

      it "index shows user cookbooks" do
        expect(@user.cookbooks.count).to eq 1
      end

      it "renders the show view" do
        get :show, user_id: @user.id, id: @cookbook.id

        expect(response).to render_template("show")
      end

      it "renders the #new view" do
        get :new, user_id: @user.id

        expect(response).to render_template("new")
      end

      it "get #new makes a new cookbook" do
        get :new, user_id: @user.id

        expect(assigns(:cookbook)).to be_a Cookbook
      end

      it "post #create persists the cookbook to the db" do
        post :create, user_id: @user.id, cookbook: attributes_for(:cookbook)

        #one from the before each, one from the cookbook attributes_for
        expect(Cookbook.all.count).to eq 2
      end
    end

    context "Logged in users can only edit their own cookbooks" do
      before :each do
        @user = create :user
        session[:user_id] = @user.id
        @cookbook = create :cookbook
        get :edit, user_id: @user.id, id: @cookbook.id
      end

      it "renders the #edit view" do
        expect(response.status).to eq 200
        expect(response).to render_template("edit")
      end

      it "saves the updates" do
        put :update, user_id: @user.id, id: @cookbook.id, cookbook: attributes_for(:cookbook, name: "Delish Treats")
        @cookbook.reload

        expect(@cookbook.name).to eq "Delish Treats"
      end

      it "redirects to the cookbook index page" do
        put :update, user_id: @user.id, id: @cookbook.id, cookbook: attributes_for(:cookbook, name: "Delish Treats")
        @cookbook.reload

        expect(subject).to redirect_to user_cookbooks_path(@cookbook.user_id)
      end

      it "redirects other users to their dashboard" do
        @unauth_user = create :user, username: "wronguser"
        session[:user_id] = @unauth_user
        get :edit, user_id: @user.id, id: @cookbook.id

        expect(subject).to redirect_to user_path(id: @unauth_user.id)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      user = create(:user)
      session[:user_id] = user.id
      cookbook = create(:cookbook)
      delete :destroy, user_id: user.id, id: cookbook.id
    end

    it "deletes the cookbook record" do
      expect(Cookbook.all.count).to eq 0
    end
  end
end
