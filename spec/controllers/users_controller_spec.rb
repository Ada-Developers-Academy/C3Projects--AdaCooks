require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  
  describe "GET #show" do
    it "responds successfully" do
      get :show, id: user
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the :index template" do
      get :show, id: user
      expect(response).to render_template("show")
    end

    it "assigns @user" do
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end
  end
end
