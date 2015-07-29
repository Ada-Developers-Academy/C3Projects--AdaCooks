require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET #index and #show page for not logged in user" do
    it "renders the #index view" do
      get :index

      expect(response).to render_template("index")
    end

    it "renders the #show view" do
      ingredient = create :ingredient
      get :show, id: ingredient.id

      expect(response).to render_template("show")
    end
  end



    # before :each do
    #   user = User.create(name: "first_user", email: "name@email.com", password_digest: "foobar")
    #   session[:user_id] = @user.id
    # end
    # it "renders the #show view" do
    #   get :show, id: @user.id
    #   expect(response).to render_template("show")
    # end
    #
    # it "renders the #new view" do
    #   get :new, user_id: @user
    #   expect(response).to render_template("new")
    # end

end
