require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "when successful" do
      it "redirects to user dashboard" do
        user = create :user, id: 1
        post :create, session: { email: "user@email.com", password: "password"}

        expect(response).to redirect_to(dashboard_user_path(user))
      end
    end

    context "when invalid user data" do
      it "has flash error" do
        user = create :user, id: 1

        post :create, session: { email: nil, password: "password" }

        expect(flash[:login_error]).to eq("Login failed, try again.")
      end
    end
  end

  describe "DELETE #destroy" do
    context "when a logged in user logs out" do
      it "changes the session[:user_id] to nil" do
        user = create :user
        session[:user_id] = user.id
        delete :destroy, session: {user_id: user.id}

        expect(session[:user_id]).to be nil
      end
    end
  end
end
