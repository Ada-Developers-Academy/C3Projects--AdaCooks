require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do

  describe "GET #show" do
    it "renders show view" do
      cookbook = create :cookbook
      get :show, id: cookbook.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders new view" do
      user = create :user
      session[:user_id] = user.id
      get :new, user_id: user.id

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  # def create
  #   @cookbook = Cookbook.create(cookbook_params)
  #   if @cookbook.save
  #     redirect_to dashboard_user_path(@cookbook.user)
  #   else
  #     render :new
  #   end
  # end



  describe "POST #create" do


    it "after good create, renders dashboard view" do

      @user = create :user
      params = { user_id: @user.id, cookbook: { name: "yikes", user_id: @user.id } }
      # let(:cookbook) do
      #     {
      #       user_id: @user.id,
      #       cookbook: {
      #       name: "a cookbook",
      #       user_id: @user.id
      #       }
      #     }
      #   end

      # params = { cookbook: { name: "yikes", user_id: user.id } }
      # cookbook = Cookbook.create(params[:cookbook])
      session[:user_id] = @user.id
      post :create, params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(dashboard_user_path(@user))
    end
  end

end
