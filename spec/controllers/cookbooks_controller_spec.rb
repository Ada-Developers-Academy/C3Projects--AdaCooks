require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  describe "#new" do
    it "successful http response" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders new template" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
    let(:params) { {cookbook: {name: "Green Stuff", description: "Some good healthy stuff",
    user_id: "2"} }}

    it "successful http response" do
      post(:create, params, {user_id: 2})
      expect(response).to have_http_status 200
    end

    it "redirects to index" do
      post(:create, params, {user_id: 2})
      expect(response).to redirect_to action: :index, id: 2
    end
  end

end
