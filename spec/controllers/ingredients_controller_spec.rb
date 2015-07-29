require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
let(:ingredient1) { create :ingredient, name: 'ingredient' }
before(:each) do
  session[:user_id] = 1
end

 describe "GET index" do
   it "responds successfully with an HTTP 200 status code" do
     get :index
     expect(response).to be_success
     expect(response).to have_http_status(200)
   end

   it "renders the index template" do
     get :index
     expect(response).to render_template("index")
   end
 end

 describe "GET #show" do
   it "responds successfully with an HTTP 200 status code" do
     get :show, id: ingredient1.id
     expect(response).to be_success
     expect(response).to have_http_status(200)
   end

   it "displays information related to the given record" do
     get :show, id: ingredient1.id
     expect(ingredient1.name).to eq 'ingredient'
   end
 end


  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new, id: ingredient1.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "displays information related to the given record" do
      get :new, id: ingredient1.id
      expect(ingredient1.name).to eq 'ingredient'
    end
  end

  describe "POST #create" do
    context "valid ingredient params" do
      let(:ingredient_params) do {
        ingredient:{
          name: 'ingredient'
        }
      }
      end

      it "creates a ingredient record" do
        post :create, ingredient_params
        expect(Ingredient.count).to eq 1
      end

      it "redirects to the ingredient show page" do
        post :create, ingredient_params
        expect(response).to redirect_to(ingredient_path(assigns(:ingredient)))
      end
    end

    context "invalid ingredient params" do
      let(:ingredient_params) do {
        ingredient:{
          name: nil
        }
      }
      end

      it "does not persist invalid records" do
        post :create, ingredient_params
        expect(Ingredient.count).to eq 0
      end

      it "redirects to the #new page after input fails" do
        post :create, ingredient_params
        expect(response).to redirect_to(new_ingredient_path)
      end
    end #end of context
  end #end of describe block

  describe "PUT #edit" do
    it "updates an existing record" do
      post :update, id: ingredient1, ingredient: { name: "yummy stuff" }
      ingredient1.reload
      expect(ingredient1.name).to eq("yummy stuff")
    end
  end #end of describe block

  describe "DELETE #destroy" do
    it "deletes the given story game record" do
    expect(Ingredient.count).to eq 0
    end
  end
end
