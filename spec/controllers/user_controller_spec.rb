require 'rails_helper'

RSpec.describe UserController, type: :controller do

  #create, new, & show

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
    let(:params) { {user: {username: "Mona Lisa", password: "titian", password_confirmation: "titian"} }}
    it "successful http response" do
      post(:create, params)
      expect(response).to have_http_status 302
    end

    it "redirects to user show page" do
      post(:create, params, {id: 1})
      expect(response).to redirect_to("/user/1")
    end
  end


    describe "#show" do
    let(:user) {create :user}
    before :each do 
    session[:user_id] = user.id 
      get :show, id: user.id
    end
    it "successful http response" do
      expect(response).to have_http_status 200
    end

    it "renders show" do
      expect(response).to render_template "show"
    end
  end

end
