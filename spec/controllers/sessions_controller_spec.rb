require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it "reponds successfully" do
  get :new
  expect(response).to have_http_status(200)
  expect(response).to be_success
end

it "renders the login template" do
  get :new
  expect(response).to render_template("new")
end

describe "DELETE #logout" do
    before :each do
      @user = create :user
      session[:user_id] = @user.id
      delete :logout
    end
  end
  it "resets the value of session[:user_id] to nil" do
    expect(session[:user_id]).to eq(nil)
  end
end
