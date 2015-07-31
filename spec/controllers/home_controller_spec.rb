require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index is the home pafe" do
    it "renders the #index view" do
      get :index

      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
  end
end
