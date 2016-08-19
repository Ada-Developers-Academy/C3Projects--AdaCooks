require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let (:session_params) do
        {
          email: "vika@email.com",
          password: "1234"
        }
    end

    it "creates an authenticated session" do
      user = create :user
      post :create, :session => session_params

      expect(session[:user_id]).to eq (1)
    end
  end

  describe "DELETE #destroy" do
    it "allows user to log out" do
      user = create :user
      session[:user_id] = user.id
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end
end
