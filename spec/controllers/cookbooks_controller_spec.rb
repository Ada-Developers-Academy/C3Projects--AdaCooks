require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "Only logged in users can access their cookbooks" do
    context "you can't access #new anonymously" do
      it "get #new redirects anonymous user to login" do
        get :new

        expect(response).to redirect_to login_path
        expect(response).to have_http_status(302)
      end
    end

    context "Logged in users can access #new" do

      it "renders the #new view" do
        user = create :user
        session[:user_id] = user.id
        get :new, user_id: user

        expect(response).to render_template("new")
      end
    end

    context "Logged in users can only edit and delete their own ingredients" do
      before :each do
        @logged_in_user = create :user
        @other_user = create :user, username: "other_user"
        session[:user_id] = @logged_in_user.id
        @ingredient = create :ingredient
      end

      it "renders the #edit view" do
        get :edit, id: @logged_in_user.id

        expect(response).to render_template("edit")
      end
    end
  end
end
