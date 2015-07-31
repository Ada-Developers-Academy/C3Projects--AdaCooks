require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index


      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

end
