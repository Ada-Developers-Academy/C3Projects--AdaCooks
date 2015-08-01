require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    it "requires a username" do
      user = build :user, username: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:username)
    end

    it "creates a new instance" do
      user = build :user

      expect(user).to be_valid
      expect(user.errors.keys).to_not include(:username)
    end
  end
end
