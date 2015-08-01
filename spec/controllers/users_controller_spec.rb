require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
    end
  end

  describe "GET #Signup" do
    it "responds successfully" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to be_success
      end
    end

  it "renders new template for signup" do
      get :new
      expect(response).to render_template("new")
    end

    describe "POST #create" do
    #  context "valid form input" do
    #   before :each do
    #     @params = attributes_for :user
    #   end
    # end

  it "redirects to newly created user's show page" do
      post :create, user: @params
      expect(response).to have_http_status(302)
    end
  end
end
