require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #root" do
    it "reponds successfully" do
      get :root
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "renders the root template" do
      get :root
      expect(response).to render_template("root")
    end
  end
end
