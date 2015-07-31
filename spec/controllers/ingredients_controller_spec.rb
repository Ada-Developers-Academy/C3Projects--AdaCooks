require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET 'index'" do

  it "responds successfully" do
   get :index
   expect(response).to have_http_status(200)
   expect(response).to be_success
  end

  it "renders index" do
    get 'index'
    expect(response).to render_template("index")
  end
end

  describe "GET 'show'" do
    let!(:ingredient){Ingredient.create(name: "Basil", id: 1)}

    it "responds successfully" do
     get :show, id: ingredient
     expect(response).to have_http_status(200)
     expect(response).to be_success
   end

    it "renders show page" do
      get 'show', id: 1
      expect(response).to render_template("show")
    end
    it "shows ingredients" do
     get :show, id: ingredient
     expect(assigns(:ingredient)).to eq(ingredient)
   end
  end
  describe "GET #new" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
    end

  it "responds successfully with an HTTP 200 status code" do
    get :new, user_id: @user.id
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

    it "renders new template" do
      get :new, user_id: @user.id
      expect(response).to render_template("new")
    end
  end
end
