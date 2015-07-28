require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
	describe "POST #create" do
		# don't need to `create :user` because it's already is in the db??

		let(:params) { { :session => { username: 'Toastee', password: 'jentoof' } } }
		let(:bad_params) { { :session => { username: 'Hemingway', password: 'havana' } } }
		let(:bad_password_params) { { :session => { username: 'Toastee', password: 'flav' } } }

		describe "#identify_user" do
			context "the user has an account" do
				it "the user's account is assigned to @user" do
					post :create, params
					expect(assigns(:user)).to eq User.find_by(username: 'Toastee')
				end
			end

			context "the user does not have an account" do
				it "the user is redirected to the register page" do
					post :create, bad_params
					expect(subject).to redirect_to(new_user_path)
				end

				it "flash errors are sent regarding the error" do
					post :create, bad_params
					expect(flash[:notice]).to_not be nil
				end
			end
		end

		describe "#authenticate" do
			context "when credentials aren't authenticated" do
				it "the user is redirected back to the login page" do
					post :create, bad_password_params
					expect(subject).to redirect_to(sessions_path)
				end

				it "flash errors are sent regarding the error" do
					post :create, bad_password_params
					expect(flash[:error]).to_not be nil
				end
			end
		end

		context "when credentials are authenticated" do
			it "assign user_id to the session" do
				post :create, params
				expect(session[:user_id]).to eq 1
			end

			it "the user is redirected to their page" do
				post :create, params
				expect(subject).to redirect_to(:controller => :users, :action => :show, :id => 1)
			end
		end
	end

	describe "DELETE #destroy" do
		context "user tries to log out" do
			it "the session is reset" do
				delete :destroy, id: 1
				expect(session[:user_id]).to eq nil
			end

			it "the user is redirected to the homepage" do
				delete :destroy, id: 1
				expect(subject).to redirect_to root_path
			end
		end
	end
end
