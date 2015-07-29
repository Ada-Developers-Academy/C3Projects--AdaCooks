require 'rails_helper'

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
end
