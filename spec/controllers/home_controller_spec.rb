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

  describe "POST #search" do
    before :each do
      @ingredient_name = "eggs"
      @ingredient = create :ingredient, name: @ingredient_name
    end

    context "search term matches an ingredient exactly" do
      it "redirects to the ingredient's show page" do
        post :search, search: { query: @ingredient_name }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(ingredient_path(@ingredient))
      end

      it "flashes a success message" do
        post :search, search: { query: @ingredient_name }
        expect(flash[:success].nil?).to eq(false)
        expect(flash[:error].nil?).to eq(true)
      end
    end

    context "search term does not match an ingredient exactly" do
      it "redirects to the ingredient's show page" do
        post :search, search: { query: "adslkhjadfslkhjasdfhljk" }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

      it "flashes an error message" do
        post :search, search: { query: "adslkhjadfslkhjasdfhljk" }
        expect(flash[:error].nil?).to eq(false)
        expect(flash[:success].nil?).to eq(true)
      end
    end
  end
end
