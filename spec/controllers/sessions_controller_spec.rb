require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:session_params) { { :session => { email: 'email@email.com', password: 'password' } } }
  let(:invalid_session) { { :session => { email: 'email@email.com' } } }
  let(:user_params) { { :user => { name: "name", email: "email@email.com", password: "password", password_confirmation: "password" } } }
  let(:invalid_user) { { :user => { name: "name", email: "email_at_email.com", password: "password", password_confirmation: "password" } } }

  describe "GET #new" do
    context "valid params" do
      it "creates a new instance of User" do
        get :new, user_params
        expect(assigns(:user)).to be_kind_of(User)
      end
    end

    context "invalid params" do
      it "doesn't instantiate User with invalid params" do
        get :new, invalid_user
        expect(User.count).to eq 0
      end
    end
  end

  describe "POST #create" do
    before :each do @user = create :user end

    context "valid params" do
      it "creates a Session" do
        post :create, session_params
        expect(assigns(:user)).to eq User.find_by(email: 'email@email.com')
      end

      xit "the user is redirected to profile page" do
        post :create, session_params
        expect(subject).to redirect_to(user_path(@user.id))
      end
    end

    context "invalid params" do
      it "redirects to the login page" do
        post :create, invalid_session
        expect(subject).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do @user = create :user end

    it "the session is reset" do
      delete :destroy, id: @user.id
      expect(session[:user_id]).to eq nil
    end

    it "redirects to the home page" do
      delete :destroy, id: @user.id
      expect(subject).to redirect_to(root_path)
    end
  end

end
