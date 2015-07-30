require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  let(:cookbook) {create :cookbook}

  describe "GET#Show" do
    it "renders the :show view for a cookbook" do
       get :show, user_id: 1, id: cookbook.id
       expect(response).to render_template("show")
    end
  end
  # describe "Delete#Destroy" do
  #   it "Deletes Cookbook from Database" do
  #
  #     delete :destroy, user_id: cookbook.user_id, id: cookbook.id
  #     expect(cookbook).to_not be_valid
  #   end
  # end
  # describe "POST #create" do
  #   context "Valid cookbook params" do
  #     let(:cookbook_params) do
  #       {
  #         cookbook: {
  #           name: 'a tale',
  #           description: 'a lot',
  #           user_id: 1
  #         }
  #       }
  #     end
  #     it "creates an Cookbook " do
  #       post :create, cookbook_params
  #       expect(Cookbook.count).to eq 1
  #     end
  #   end
  # end
end
