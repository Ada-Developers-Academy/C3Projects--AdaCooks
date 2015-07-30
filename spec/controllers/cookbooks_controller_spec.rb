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
        cookbook = create :cookbook
        user = create :user
        session[:user_id] = user.id
        get :show, user_id: 2, id: cookbook.id
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
        cookbook = create :cookbook
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: user.id, id: cookbook.id
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
        cookbook = create :cookbook
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: 2, id: cookbook.id
      end

      it "does not respond successfully" do
        expect(response).to_not be_success
      end

      it "redirects to the home page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    describe "user not logged in" do
      it "redirects to the login page" do
        expect(response).to redirect_to(login_path)
      end
    end

    describe "user logged in" do
      context "valid cookbook params" do

      end

      context "invalid cookbook params" do

      end
    end
  end
end
