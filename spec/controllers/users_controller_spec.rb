require 'rails_helper'
require 'pry'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    subject { post :create, :user => { name: "User", email: "soandso@so.com", password: "soandso", password_confirmation: "soandso", id: 1} }

    it "redirects to the :dashboard view" do
      expect(subject).to redirect_to("/users/#{assigns(:user).id}/dashboard")
    end
  end

  describe "invalid user registration" do
    it "flashes errors when invalid" do
      post :create, user: {email: nil}

      expect(flash[:error]).to eq("Registration failed, try again.")
    end
  end

  # describe "GET #dashboard" do
  #   it "renders dashboard" do
  #     get :dashboard

  #     expect()
  #   end
  # end
end
