require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  # def new
  #   @ingredient = Ingredient.new
  # end

  describe "GET #new" do
    it "renders :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  # describe "GET #new" do
  #   it "renders new view" do
  #     user = create :user
  #     session[:user_id] = user.id
  #     get :new, user_id: user.id
  #
  #     expect(response).to be_success
  #     expect(response).to have_http_status(200)
  #     expect(response).to render_template(:new)
  #   end
  # end

end
