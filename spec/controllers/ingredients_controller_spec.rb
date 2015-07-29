require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET #show" do
    let(:ingredient) { create :ingredient }

    before :each do
      get :show, id: ingredient
    end

    it "responds with an HTTP 200 status" do
      expect(response).to have_http_status 200
    end

    it "renders the show template" do
      expect(response).to render_template "show"
    end
  end
end
