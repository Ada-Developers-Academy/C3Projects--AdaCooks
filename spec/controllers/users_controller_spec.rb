require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    before :each do
      @user = create(:user)
      get :show, id: 1
    end

    it "renders the user show page" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(subject).to render_template(:show)
    end

    it "assigns @user" do
      expect(assigns(:user).id).to eq @user.id
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
    context "no username" do
      before :each do
        @user = build(:user, username: "")
        post :create, user: attributes_for(:user, username: "")
      end

      it "doesn't persist the user to the db" do
        expect(User.count).to eq 0
      end

      it "renders new view" do
        expect(subject).to render_template(:new)
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:registration_error])
      end
    end

    context "duplicate username" do
      before :each do
        create(:user)
        post :create, user: attributes_for(:user)
      end

      it "doesn't persist the user to the db" do
        expect(User.where(username: "user1").count).to eq 1
      end

      it "renders new view" do
        expect(subject).to render_template(:new)
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:registration_error])
      end
    end

    context "invalid password and password confirmation (do not match)" do
      before :each do
        post :create, user: attributes_for(:user, password_confirmation: "wrong")
      end

      it "doesn't persist the user to the db" do
        expect(User.count).to eq 0
      end

      it "renders new view" do
        expect(response).to render_template(:new)
      end

      it "assigns flash[:errors]" do
        expect(flash[:errors]).to include(ApplicationController::ERRORS[:registration_error])
      end
    end

    context "valid new user" do
      before :each do
        post :create, user: attributes_for(:user)
      end

      it "adds the new user to the db" do
        expect(User.count).to eq 1
      end

      it "redirects to the users dashboard" do
        expect(subject).to redirect_to user_path(id: User.first.id)
      end

      it "signs them into a session" do
        expect(session[:user_id]).to eq User.first.id
      end
    end
  end
end
