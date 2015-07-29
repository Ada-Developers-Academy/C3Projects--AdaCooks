require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
      def require_login_test
        require_login
      end

      def logged_in_test
        logged_in
      end
    end

  describe "#require_login" do
    # before :each do
    #   @user = create :user
    #   routes.draw { get "require_login_test" => "anonymous#require_login_test" }
    # end

    context "user logged in" do
      before :each do
        @user = create :user
        binding.pry
        routes.draw { get "require_login_test" => "anonymous#require_login_test" }
        get :require_login_test, session: { user_id: @user.id }
      end

      # FIXME: This test does not pass because the session is not being set
      it "does not flash an error" do
        puts @user.id
        puts session[:user_id].inspect
        expect(flash[:errors]).to eq []
      end
    end

    context "user not logged in" do
      before :each do
        get :require_login_test#, session: { user_id: nil }
      end

      it "flashes error message" do
        expect(flash[:errors]).to include("You must be logged in to view this page!")
      end

      it "redirects to login_path" do
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#logged_in" do
    before :each do
      @user1 = create :user
      @user2 = create :user, username: 'happy', email: 'happy@happy.com'

      session[:user_id] = @user1.id
      routes.draw { get "logged_in_test" => "anonymous#logged_in_test" }
    end

    it "assigns @user to the user in the session" do
      get :logged_in_test

      expect(assigns(:user)).to eq @user1
    end

    context "the logged in user is the user we're looking at" do
      it "redirects to home page" do
        get :logged_in_test, params: { user_id: @user1.id }

        expect(response).to redirect_to root_path
      end
    end

    context "the logged in user is not the user we're looking at" do
      it "redirects to the logged in user's home page" do
        get :logged_in_test, params: { user_id: @user2.id }

        expect(response).to redirect_to root_path
      end
    end
  end
end
