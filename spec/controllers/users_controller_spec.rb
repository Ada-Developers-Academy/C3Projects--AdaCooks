require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the index view" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(subject).to render_template(:index)
    end

    it "assigns @users instance variable" do
      %w(user1 user2 user3).each do |username|
        create(:user, username: username)
      end

      get :index

      expect(assigns(:users).count).to eq 3
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "renders the new view (form)" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(subject).to render_template(:new)
    end

    it "news up a user" do
      expect(assigns(:user)).to be_a User
    end
  end

  describe "POST #create" do

  end
end
