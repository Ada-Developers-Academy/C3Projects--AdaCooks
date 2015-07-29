require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #show" do
#     it "returns http success" do
#       get :show
#       expect(response).to have_http_status(:success)
#     end
#   end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    before :each do
      user = create :user, id: 2
      session[:user_id] = 2
    end
    context "with valid params" do

      let (:params) { create :cookbook }

      it "creates a new Cookbook record" do
        post :create, :cookbook => params

        expect(Cookbook.count).to eq(1)
      end
    end

    context "with invalid cookbook params" do
      let (:bad_book) { build :cookbook, name: nil }

      it "doesn't create a new cookbook" do
        post :create, :cookbook => bad_book

        expect(response).to render_template("new")
      end
    end
  end

#   describe "GET #edit" do
#     it "returns http success" do
#       get :edit
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #update" do
#     it "returns http success" do
#       get :update
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET #destroy" do
#     it "returns http success" do
#       get :destroy
#       expect(response).to have_http_status(:success)
#     end
#   end

end
