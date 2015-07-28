require 'rails_helper'

RSpec.describe User, type: :model do


  describe "model validations" do
    it "Requires that a cookbook name be present" do
      user = build :user, name: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:name)
    end

    it "Requires that a user name be unique" do
      user = create :user
      other_user = user.dup

      expect(other_user).to_not be_valid
      expect(other_user.errors[:name]).to include("has already been taken")
    end

    it "Requires that an email be present" do
      user = build :user, email: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:email)
    end

    it "Requires that an email be unique" do
      user = create :user
      other_user = user.dup

      expect(other_user).to_not be_valid
      expect(other_user.errors[:email]).to include("has already been taken")
    end

    it "Requires that an email has @" do
      user = build :user, email: "vika.email.com"

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:email)
    end
  end

end
