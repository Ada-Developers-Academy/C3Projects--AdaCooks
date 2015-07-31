require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "#new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the #new template" do
      get :new
      expect(subject).to render_template :new
    end

    it "will redirect an already signed-in user back to the home page" do
      create :user
      session[:user_id] = 1
      get :new

      expect(subject).to redirect_to(root_path)
    end

    it "throw a flash error if already signed-in user" do
      create :user
      session[:user_id] = 1
      get :new

      expect(flash).to_not be_empty
    end
  end

  # # WIP!!!
  # describe "#create" do
  #   let(:login) { build :user }
  #   let(:params) { { session: { email: login[:email], password: login[:password]} } }
  #   let(:invalid_params) { { session: { email: "", password: ""} } }
  #
  #   context "valid log-in params" do
  #     it "logs in user" do
  #       # session[:email] = login[:email]
  #       # session[:password] = login[:password]
  #       post :create, params
  #       expect(session[:user_id]).to eq 1
  #     end
  #   end
  #
  #   context "invalid user params" do
  #     it "does not login the user" do
  #       # session[:email] = login[:email]
  #       post :create, invalid_params
  #       expect(session[:user_id]).to eq nil
  #     end
  #
  #     it "renders the new user page (if unsuccessful login)" do
  #       # session[:email] = login[:email]
  #       post :create, invalid_params
  #       expect(subject).to render_template(:new)
  #     end
  #   end
  # end
end
