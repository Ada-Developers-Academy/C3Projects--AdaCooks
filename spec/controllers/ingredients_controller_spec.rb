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
      session[:user_id] = create(:ingredient)
      get :new, :id => session[:user_id]
      expect(assigns(:ingredient)).to be_a_new(Ingredient)
      expect(response).to render_template(:new)
    end
  end # new

  describe "POST #create" do
    # + test case
    context "Valid Ingredient params" do
      let(:ingred_params) do
         {
           ingredient: {
             name: 'Steak',
             image: 'steak.jpg'
           }
         }
      end

      it "creates a new Ingredient record" do
        post :create, ingred_params
        expect(Ingredient.count).to eq(1)
      end
    end
    # - test case
    context "Invalid Ingredient params" do
      let(:ingred_params) do
         {
           ingredient: {
             image: 'steak.jpg'
           }
         }
      end

      it "does not persist invalid ingredients" do
       post :create, ingred_params
       expect(Ingredient.count).to eq 0
       end

     it "renders the :new view (to allow users to fix invalid data)" do
       post :create, ingred_params
       expect(response).to render_template("new")
     end

    end
  end

  describe "GET #edit" do
    # + test case
    context "it's the user's ingredient" do
      before(:each) do
        @yams = create :ingredient, user: create(:user)
        session[:user_id] = @yams.user_id
      end

      it "renders the edit page" do
        get :edit, id: @yams
        expect(response).to render_template(:edit)
      end
    end
    # - test case
    context "it's not user's ingredient" do
      before(:each) do
        @yams = create :ingredient, user: create(:user)
        session[:user_id] != @yams.user_id
      end

      it "redirect_to ingredient_path" do
        get :edit, id: @yams
        expect(response).to redirect_to(ingredient_path(@yams))
        # undefined method `user_id' for nil:NilClass??
      end
    end
  end

  describe "PATCH #update" do
    context "sucessful update" do
      before(:each) do
        @yams = create :ingredient, user: create(:user)
        session[:user_id] = @yams.user_id
      end

      it "changes recipe's name" do
        patch :update, :id => @yams, :ingredient => {name: "sweet potatoez"}
        @yams.reload
        expect(@yams.name).to eq("sweet potatoez")
      end

      it "redirect_to user_path" do
        patch :update, id: @yams, :ingredient => {name: "sweet potatoez"}
        expect(response).to redirect_to(user_path(@yams.user_id))
      end
    end

    context "unsucessful update" do
      before(:each) do
        @yams = create :ingredient, user: create(:user)
        session[:user_id] = @yams.user_id
      end

      it "renders edit form if unsuccessful update" do
        patch :update, :id => @yams, :ingredient => {name: nil}
        @yams.reload
        expect(@yams).to render_template(:edit)
      end
    end

  end


  describe "DELETE #destroy" do
    before(:each) do
      @pine = create :ingredient
      @pop = create :ingredient, name: "PopTarts"
      session[:user_id] = 20
    end

    it "ingredient count changes by -1" do
      expect{delete :destroy, {id: @pine.id}}.to change(Ingredient, :count).by(-1)
    end

    it "redirect_to root_path" do
      delete :destroy, id: @pine.id
      expect(response).to redirect_to(user_path(session[:user_id]))
    end
  end # destroy

end # describe
