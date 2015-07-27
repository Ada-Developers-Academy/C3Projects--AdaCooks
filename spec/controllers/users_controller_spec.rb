require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
    end
  end
end
