require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:pineapple) {create :ingredient}

    it "returns successfully with HTTP code of 200" do
      get :show, id: pineapple
      expect(response).to be_success
    end

    it "renders the :show view" do
      get :show, id: pineapple
      expect(response).to render_template(:show)
    end
  end



  describe "POST #create" do

  end

  describe "DELETE #destroy" do

  end

end # describe
