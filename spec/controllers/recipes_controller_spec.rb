require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end

  describe "GET #show" do
    it "returns http success" do
      user = create :user
      session[:user_id] = 1
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      user = create :user
      session[:user_id] = 1
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do

    before :each do
      user = create :user, id: 1
      session[:user_id] = 1
      ingredient = create :ingredient
    end

    context "with valid params" do

      let (:params) do { name: "name", description: "some stuff", user_id: 1, preparation: "do some stuff", :ingredient_ids => [1]  }
      end

      it "creates a new Recipe record" do
        post :create, :recipe => params

        expect(Recipe.count).to eq(1)
      end
    end

    context "with invalid recipe params" do
      let (:bad_params) do { name: "a recipe name", description: "some stuff", user_id: 1 }
      end

      it "doesn't create a new recipe" do
        post :create, :recipe => bad_params

        expect(response).to render_template(:new)
      end
    end
  end


#   describe "GET #create" do
#     it "returns http success" do
#       get :create
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
