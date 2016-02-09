require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    describe "username" do
      it "requires a username" do
        user = build :user, username: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:username)
      end

      it "requires username to be unique" do
        user = create :user
        user1 = build :user, email: "sam@sam.com"

        expect(user1).to_not be_valid
        expect(user1.errors.messages).to include(:username => ["has already been taken"])
      end
    end

    describe "email" do
      it "requires an email" do
        user = build :user, email: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:email)
      end

      it "requires email to be unique" do
        user = create :user
        user1 = build :user, username: "sam"

        expect(user1).to_not be_valid
        expect(user1.errors.messages).to include(:email => ["has already been taken"])
      end
    end

    it "requires a password" do
      user = build :user, password: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:password)
    end
  end
end
