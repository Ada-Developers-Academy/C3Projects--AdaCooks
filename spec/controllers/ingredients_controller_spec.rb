require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end # index

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
  end #show

  describe "GET #new" do
    let(:pineapple) {create :ingredient}

    it "creates a new ingredient" do
      get :new
      expect(assigns(:ingredient)).to be_a_new(Ingredient)
      expect(response).to render_template(:new)
    end

  end # new


  describe "POST #create" do

  end # create

  describe "DELETE #destroy" do
    before(:each) do
      @pine = create :ingredient
      @pop = create :ingredient, name: "PopTarts"
    end

    it "ingredient count changes by -1" do
      expect{delete :destroy, {id: @pine.id}}.to change(Ingredient, :count).by(-1)
    end

    it "redirect_to root_path" do
      delete :destroy, id: @pine.id
      expect(response).to redirect_to(root_path)
    end
  end # destroy


end # describe
