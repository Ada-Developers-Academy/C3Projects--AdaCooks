require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model validations" do
    it "Requires that a name must be present" do
      bad_user = build :user, username: nil

      expect(bad_user).to_not be_valid
      expect(bad_user.errors.keys).to include(:username)
    end
  end
end
