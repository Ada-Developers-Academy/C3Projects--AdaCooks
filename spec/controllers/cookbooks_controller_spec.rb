require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    let(:book) {create :cookbook}

    it "returns successfully with HTTP code of 200" do
      get :show, id: book
      expect(response).to be_success
    end

    it "renders the :show view" do
      get :show, id: book
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    let(:book) {create :cookbook}

    it "creates a new cookbook" do
      get :new
      expect(assigns(:cookbook)).to be_a_new(Cookbook)
      expect(response).to render_template(:new)
    end
  end # new

  # describe "POST #create" do
  #   # + test case
  #   context "Valid Ingredient params" do
  #     let(:ingred_params) do
  #        {
  #          ingredient: {
  #            name: 'Steak',
  #            image: 'steak.jpg'
  #          }
  #        }
  #     end
  #
  #     it "creates a new Ingredient record" do
  #       post :create, ingred_params
  #       expect(Ingredient.count).to eq(1)
  #     end
  #   end
  #   # - test case
  #   context "Invalid Ingredient params" do
  #     let(:ingred_params) do
  #        {
  #          ingredient: {
  #            image: 'steak.jpg'
  #          }
  #        }
  #     end
  #
  #     it "does not persist invalid ingredients" do
  #      post :create, ingred_params
  #      expect(Ingredient.count).to eq 0
  #      end
  #
  #    it "renders the :new view (to allow users to fix invalid data)" do
  #      post :create, ingred_params
  #      expect(response).to render_template("new")
  #    end
  #
  #   end
  # end # create

  # describe "DELETE #destroy" do
  #   before(:each) do
  #     @cookbook1 = create :cookbook, { name: "Paula Deen vs Jimmy Dean" }
  #     @cookbook2 = create :cookbook, name: "PopTarts"
  #   end
  #
  #   it "cookbook count changes by -1" do
  #     expect{delete :destroy, {id: @cookbook1.id}}.to change(Cookbook, :count).by(-1)
  #   end
  #
  #   it "redirect_to root_path" do
  #     delete :destroy, id: @cookbook1.id, cookbook1: { name: "Paula Deen vs Jimmy Dean" }
  #     expect(response).to redirect_to(user_path(session[:user_id]))
  #   end
  # end

end
