require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "#create" do
		it "instantiates a new User object" do
			user = create :user
			expect(User.all).to include(user) # `expect(user).to exist` failed - why?
		end

		it "redirects to user's page if information is valid" do
			user_params = { :user => { name: 'Toastee', email: 'toastee@flavaflav.com', password: 'jentoof', password_confirmation: 'jentoof' } }
			post :create, user_params

			expect(subject).to redirect_to(:action => :show, :id => assigns(:user).id)
			# error: Expected response to be a <redirect>, but was <200> - whyy?
		end

		it "renders :new view if the information is invalid" do
			user_params = { :user => { name: 'Toastee', email: nil } }
			post :create, user_params

			expect(subject).to render_template(:new)
		end
	end
end
