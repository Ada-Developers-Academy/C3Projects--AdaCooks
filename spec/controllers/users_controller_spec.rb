require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #new" do
		it "receives a flash error if the user is already logged in" do
			session[:user_id] = 1
			get :new

			expect(flash[:notice]).to_not be nil
		end
	end

	describe "POST #create" do
		let(:user_params) { { :user => { username: "drinkmaster", email: "sample@email.com", password: "password", password_confirmation: "password" } } }

		it "instantiates a new User object" do
			post :create, user_params
			expect(User.all.count).to eq 1
		end

		it "assigns the user_id for the session" do
			post :create, user_params
			expect(session[:user_id]).to eq 1
		end

		it "redirects to user's page if information is valid" do
			post :create, user_params
			expect(subject).to redirect_to(:action => :show, :id => assigns(:user).id)
		end

		it "renders :new view if the information is invalid" do
			user_params = { :user => { name: 'Toastee', email: nil } }
			post :create, user_params

			expect(subject).to render_template(:new)
		end
	end
end
