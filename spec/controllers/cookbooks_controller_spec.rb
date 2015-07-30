require 'rails_helper'

RSpec.describe CookbooksController, type: :controller do
  before :each do session[:user_id] = 1 end
  let(:cookbook_params) { { :cookbook => { name: "name" } } }
  let(:invalid_params) { { :cookbook => { desc: "desc" } } }

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    context "valid params" do
      it "creates a new instance of Cookbook" do
        get :new, cookbook_params
        expect(assigns(:cookbook)).to be_kind_of(Cookbook)
      end
    end

    context "invalid params" do
      it "doesn't instantiate Cookbook with invalid params" do
        get :new, invalid_params
        expect(Cookbook.count).to eq 0
      end
    end
  end

  describe "POST #create" do
    context "valid params" do
      it "creates a Cookbook record" do
        post :create, cookbook_params
        expect(Cookbook.count).to eq 1
      end

      it "redirects to the user show page" do
        post :create, cookbook_params
        expect(subject).to redirect_to(user_path(session[:user_id]))
      end
    end

    context "invalid params" do
      it "does not persist invalid records" do
        post :create, invalid_params
        expect(Cookbook.count).to eq 0
      end

      it "renders the :new view (to allow users to fix invalid data)" do
        post :create, invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:new_params) { { :cookbook => { name: "a name" } } }
    before :each do @book = create :cookbook end

    context "valid params" do
      it "updates an existing record" do
        put :update, { id: @book.id }.merge(new_params)
        @book.reload
        expect(@book.name).to eq "a name"
      end

      it "redirects to the show page" do
        patch :update, { id: @book.id }.merge(new_params)
        @book.reload
        expect(subject).to redirect_to(user_path)
      end
    end

    context "invalid params" do
      it "does not persist invalid record updates" do
        patch :update, { id: @book.id }.merge(invalid_params)
        @book.reload
        expect(@book.name).to eq "Book Name"
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do @book = create :cookbook end

    context "clicking the delete button" do
      it "removes a record" do
        expect {
          delete :destroy, {:id => @book.id}
          }.to change(Cookbook, :count).by(-1)
      end

      it "redirects to the show page" do
        delete :destroy, id: @book.id
        expect(subject).to redirect_to(user_path)
      end
    end
  end

end
