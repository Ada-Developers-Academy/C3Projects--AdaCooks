require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "#new" do
    let(:user) { FactoryGirl.create(:user)}
    before :each do
      session[:user_id] = user.id
    end
    it "successful http response" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders new template" do
      get :new
      expect(response).to render_template "new"
    end
  end

  describe "#create" do
    let(:params) { {ingredient: {name: "coco", user_id: "1"} }}
    let(:user) { FactoryGirl.create(:user)}
    before :each do
      session[:user_id] = user.id
    end
    it "successful http response" do
      post(:create, params, {user_id: 1})
      expect(response).to have_http_status 302
    end

    it "redirects to index" do
      post(:create, params, {id: 1})
      expect(response).to redirect_to("/ingredients_by_user/1")
    end
  end

  describe "#show" do
    let(:ingredient) {create :ingredient}
    before :each do 
      get :show, id: ingredient.id
    end
    it "successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders show" do
      expect(response).to render_template "show"
    end
  end

  describe "#edit" do
    let(:ingredient) {create :ingredient}
    before :each do 
      get :edit, id: ingredient.id, user_id: ingredient.user_id
    end
    it "has successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders edit" do
      expect(response).to render_template "edit"
    end
  end

  describe "#update" do
    let(:ingredient) {create :ingredient}

    it "updates an instance" do
      ingredient.update(name: "strawberries")
      expect(ingredient.name).to eq "strawberries"
    end
  end

end
