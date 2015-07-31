require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      user = create :user
      session[:user_id] = user.id

      get :new, user_id: user.id

      expect(response).to render_template("new")
    end
  end



end
