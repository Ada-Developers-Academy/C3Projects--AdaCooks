require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user_params) { { :user => { name: "name", email: "email@email.com", password: "password", password_confirmation: "password" } } }
  let(:invalid_params) { { :user => { name: "name", email: "email_at_email.com", password: "password", password_confirmation: "password" } } }

  describe "GET #new" do
    context "valid params" do
      it "creates a new instance of User" do
        get :new, user_params
        expect(assigns(:user)).to be_kind_of(User)
      end
    end

    context "invalid params" do
      it "doesn't instantiate User with invalid params" do
        get :new, invalid_params
        expect(User.count).to eq 0
      end
    end
  end

  describe "GET #show" do
    before :each do 
      @user = create :user
      session[:user_id] = @user.id
    end

    context "visiting the user profile" do
      it "renders the show page" do
        get :show, id: @user.id
        expect(response).to be_success
        expect(response).to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    context "valid params" do
      it "creates a Cookbook record" do
        post :create, user_params
        expect(User.count).to eq 1
      end

      it "redirects to the user show page" do
        post :create, user_params
        expect(subject).to redirect_to(user_path(session[:user_id]))
      end
    end

    context "invalid params" do
      it "does not persist invalid records" do
        post :create, invalid_params
        expect(User.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

end
