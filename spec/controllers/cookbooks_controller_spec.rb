require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  let(:cookbook) { create :cookbook }
  let(:user) { create :user }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, user_id: user

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index, user_id: user

      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: cookbook, user_id: user

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders show template" do
      get :show, id: cookbook, user_id: user

      expect(response).to render_template("show")
    end
  end
end
