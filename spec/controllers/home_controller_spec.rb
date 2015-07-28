require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "get #index" do
    before :each do
      get :index
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
end
