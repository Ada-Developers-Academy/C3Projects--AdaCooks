require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  describe "GET #show" do
    before :each do
      cookbook = create :cookbook
      user = create :user
      session[:user_id] = user.id
      get :show, user_id: user.id, id: cookbook.id
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show view" do
      expect(response).to render_template("show")
    end
  end
end
