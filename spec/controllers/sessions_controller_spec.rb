require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "get #new page for login" do
    it "renders the login #new page" do
    get :new

    expect(response).to be_success
    expect(response).to have_http_status(200)
    end
  end

  describe "POST #create creates a new session" do
    before :each do
      @user = create :user
    end
    context "invalid login" do
      it "without login session id is nil" do

        expect(session[:user_id]).to be nil
      end

      it "invalid password renders the page with error message" do
        post :create, session: { username: @user.username, password: 'invalid' }

        expect(response).to render_template(:new)
        expect(flash[:errors]).to include { :login_error }
      end

      it "invalid username renders the page with error message" do
        post :create, session: { username: "invalid_user", password: @user.password }

        expect(response).to render_template(:new)
        expect(flash[:errors]).to include { :login_error }
      end
    end

    context "valid login" do
      before :each do
        post :create, session: {username: @user.username, password: @user.password}
      end

      it "session id is equal to user id" do
        expect(session[:user_id]).to eq @user.id
      end

      it "redirects to the user's show page" do
        expect(response).to redirect_to user_path(@user)
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "Delete #destroy is logout" do
    before :each do
      @user = create :user
      post :create, session: {username: @user.username, password: @user.password}
      delete :destroy
    end

    it "sets session user_id to nil" do
      expect(session[:user_id]).to be nil
    end

    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end
  end  
end
