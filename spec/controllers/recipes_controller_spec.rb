require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET 'index'" do
    it "renders index" do
      get 'index'
      expect(response).to render_template("index")
    end
  end

  describe "GET 'show' " do
    let!(:recipe){Recipe.create(name: "Hot Tamale Chicken", description: "Corn Husks and Masa filled goodness", preparation: "Cook in oven til warm.", user_id: 1)}
    it "renders show page" do
      get 'show', id: 1
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do


    it "responds successfully with an HTTP 200 status code" do
      @user = create :user
      session[:user_id] = @user.id
      get :new, user_id: @user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

   it "creates a new Recipe object" do
     session[:user_id] = create(:user)
     get :new
     expect(assigns(:recipe)).to be_kind_of(Object)
   end
 end
end
