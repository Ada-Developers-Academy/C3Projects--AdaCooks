require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "#new" do
    let(:user) { FactoryGirl.create(:user)}
    before :each do
      session[:user_id] = user.id
    end
    it "successful http response" do
      get :new, user_id: user.id
      expect(response).to have_http_status 200
    end

    it "renders new template" do
      get :new, user_id: user.id
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
    let(:params) do 
      { user_id: "1",
        recipe: 
        {name: "Kale peanut butter", 
         description: "Soooo Good", 
         instructions: "Roast kale with salt first.",
         cookbook_ids: [] 
          }}
    end
    let(:cookbook) { FactoryGirl.create(:cookbook)}
    let(:user) { FactoryGirl.create(:user)}
    before :each do
      session[:user_id] = user.id
    end
    it "successful http response" do
      post :create, params
      expect(response).to have_http_status 302
    end

    it "redirects to index" do
      post(:create, params)
      expect(response).to redirect_to("/user/1/ingredients/new")
    end
  end

  describe "#show" do
    let(:recipe) {create :recipe}
    let(:user) { FactoryGirl.create(:user)}
    before :each do 
      session[:user_id] = user.id
      recipe.update(user: user)
      get :show, id: recipe.id
    end
    it "successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders show" do
      expect(response).to render_template "show"
    end
  end

  describe "#edit" do
    let(:recipe) {create :recipe}
    before :each do 
      get :edit, id: recipe.id, user_id: recipe.user_id
    end
    it "has successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders edit" do
      expect(response).to render_template "edit"
    end
  end

  describe "#update" do
    let(:recipe) {create :recipe}

    it "updates an instance" do
      recipe.update(name: "strawberry banana")
      expect(recipe.name).to eq "strawberry banana"
    end
  end


end
