require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
      def require_login_test
        require_login
      end
    end
  describe "#require_login" do
    before :each do
      @user = create :user
      routes.draw { get "require_login_test" => "anonymous#require_login_test" }
    end

    context "user logged in" do
      before :each do
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
        get :require_login_test, session: { user_id: nil }
      end

      it "flashes error message" do
        expect(flash[:errors]).to include("You must be logged in to view this page!")
      end

      it "redirects to login_path" do
        expect(response).to redirect_to login_path
      end
    end
  end
end
