require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid user params" do

      let (:params) { create :user }

      it "creates a new user" do
        post :create, :user => params
        expect(User.count).to eq(1)
      end
    end

    context "with invalid user params" do
      let (:yuck_user) { build :user, password_confirmation: "nope"}

      it "doesn't create a new user" do
        post :create, :user => yuck_user

        expect(response).to redirect_to(new_user_path)
      end
    end
  end

  describe "GET #show" do
    before :each do
      @user = create :user
    end

    it "returns http success" do
      get :show, :id => 1

      expect(response).to have_http_status(:success)
    end

    it "loads a user into @user" do
      get :show, :id => 1

      expect(assigns(:user)).to eq(@user)
    end
  end
end
