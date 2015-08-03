require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe "#error_check(attribute)" do
    before :each do
      @user = create :user
      @user.errors[:username] = "can't be blank"
    end

    it "checks if @user has any errors" do
      expect(helper.error_check(:username)).to_not be nil
      expect(helper.error_check(:email)).to eq nil
    end

    it "sets flash.now to have an error for the invalid attribute" do
      helper.error_check(:username)
      expect(flash.now[:username_error]).to_not be nil
    end

    it "formats the error message" do
      expect(@user.errors[:username]).to_not eq "Can't be blank."
      expect(helper.error_check(:username)).to eq "Can't be blank."
    end
  end
end
