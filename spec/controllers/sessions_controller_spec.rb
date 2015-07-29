require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = create(:user)
    session[:user_id] = @user.id
  end

  after(:each) do
    @user.destroy
  end

  describe "POST #create" do

    let (:session_params) do
            {
              username: "myspacerox",
              password: "2002"}
          end

    it "creates an authenticated session" do
      post :create, :session => session_params
      expect(session[:user_id]).to eq(2)
      end
  end


  describe "DELETE #destroy" do
    it "allows user to log out" do
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end
  end

  # describe "POST #create" do
  #
  #   let (:session_params) { create :session, username: "myspacerox", password: "2002"}
  #
  #   it "creates an authenticated session" do
  #     user = build :user
  #     session_params
  #     post :create, :session => session_params
  #
  #     expect(session[:user_id]).to eq(1)
  #     end
  # end










end
