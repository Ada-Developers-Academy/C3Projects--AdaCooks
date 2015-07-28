require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    before :each do
      %w(Happy Lovely Pig Darling Appetite Bumpkin).each do |name|
        create(:recipe, name: name)
      end
    end

    it "instantiates a variable that is all the recipes in alpha_order" do
      get :index

      expect(response.status).to eq 200
      expect(assigns(:recipes).first.name).to eq "Appetite"
    end

    it "renders the recipes#index view" do
      get :index

      expect(subject).to render_template :index
    end
  end
end
