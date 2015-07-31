require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  describe "#new" do
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
    let(:params) { {cookbook: {name: "Green Stuff", description: "Some good healthy stuff",
    user_id: "2"} }}

    it "successful http response" do
      post(:create, params, {user_id: 2})
      expect(response).to have_http_status 302
    end

    it "redirects to index" do
      post(:create, params, {user_id: 2})
      expect(response).to redirect_to("/user/2/cookbooks")
    end
  end

  describe "#show" do
    let(:cookbook) {create :cookbook}
    before :each do 
      get :show, id: cookbook.id
    end
    it "successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders show" do
      expect(response).to render_template "show"
    end
  end

  describe "#edit" do
    let(:cookbook) {create :cookbook}
    before :each do 
      get :edit, id: cookbook.id, user_id: cookbook.user_id
    end
    it "has successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders edit" do
      expect(response).to render_template "edit"
    end
  end

  describe "#update" do
    let(:cookbook) {create :cookbook}
    let(:params) { {cookbook: {name: "Chocolate", description: "Good!"}}}

    it "updates an instance" do
      cookbook.update(description: "Yum!")
      expect(cookbook.description).to eq "Yum!"
    end

    # it "redirects_to #index" do
    #   patch :update, params, id: cookbook.id
    #   expect(respons).to redirect_to "/user/2/cookbooks"
    # end
  end

  # describe "#destroy" do
  #   let(:cookbook) {create :cookbook}
  #   # before :each do
  #   #   cookbook 
  #   # end
  #   it "deletes a cookbook" do 
  #     # params = { user_id: cookbook.user_id, id: cookbook.id }
 
  #     delete :destroy, id: cookbook.id
  #     expect(response.body).to eq "destroy called"
  #   end
  # end

end
