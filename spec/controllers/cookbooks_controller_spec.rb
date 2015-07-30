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
    it "renders 'new' template" do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe "GET #create" do

    before :each do
      user = create :user, id: 2
      session[:user_id] = 2
    end

    context "with valid params" do

      let (:params) do { name: "name", description: "some stuff", user_id: 2 }
      end

      it "creates a new Cookbook record" do
        post :create, :cookbook => params

        expect(Cookbook.count).to eq(1)
      end
    end

    context "with invalid cookbook params" do
      let (:bad_book) do { description: "some stuff", user_id: 2 }
      end

      it "doesn't create a new cookbook" do
        post :create, :cookbook => bad_book

        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH #update" do
    it "returns updates a cookbook record" do
      cookbook = create :cookbook
      old_description = cookbook.description

      patch :update, id: cookbook.id, cookbook: { id: 1, description: "A better desc"}

      expect(cookbook.description).to_not eq old_description
    end
  end

  describe "DELETE #destroy" do
    it "deletes a cookbook record from the database" do
      user = create :user, id: 2
      cookbook = build :cookbook
      get :destroy, :id => 1

      expect(Cookbook.count).to eq (0)
    end
  end

end
