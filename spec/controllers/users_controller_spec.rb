require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    let(:user) {create :user}

    it "creates a new ingredient" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
      before :each do
        @user = create :user
      end

      it "returns http success" do
        session[:user_id] = @user.id
        get :show, :id => 1
        expect(response).to have_http_status(:success)
      end

      it "loads a user into @user" do
        session[:user_id] = @user.id
        get :show, :id => session[:user_id]

        expect(assigns(:user)).to eq(@user)
      end
    end

    describe "POST #create" do
      context "with valid user params" do

        let (:user_params) do
          {
            username: "beaverz",
            password: "213",
            password_confirmation: "213"}
        end

        it "creates a new user" do
          post :create, :user => user_params
          expect(User.count).to eq(1)
        end
      end

      context "invalid user params" do
        let (:bad_user) do
          {
            username: "Eeeediot",
            password: "youu",
            password_confirmation: "song"}
        end

        it "doesn't create a new user" do
          post :create, :user => bad_user
          expect(response).to redirect_to(signup_path)
        end
      end
    end

end
