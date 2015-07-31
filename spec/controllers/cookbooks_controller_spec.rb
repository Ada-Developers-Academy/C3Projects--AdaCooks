require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  let(:cookbook) {create :cookbook}

  describe "GET#Show" do
    it "renders the :show view for a cookbook" do
       get :show, user_id: 1, id: cookbook.id
       expect(response).to render_template("show")
    end
  end




end
