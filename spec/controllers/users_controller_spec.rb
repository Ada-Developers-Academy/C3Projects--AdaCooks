require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      get :new

      expect(response).to render_template("new")
    end
  end

  # describe "POST #create" do
  #   let(:user) { create :user, id: 1 }
  #   it "redirects to the :dashboard view" do
  #     post :create, user

  #     expect(subject).to redirect_to(dashboard_user_path(assigns()))
  #   end
  #end
end
