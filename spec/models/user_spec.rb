require 'rails_helper'

RSpec.describe User, type: :model do

  # test associations?

  context "creating a new user" do
    describe "validates" do

      it "username is required" do
        user = build :user, username: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:username)
      end

      it "email is required" do
        user = build :user, email: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:email)
      end

      it "password is required" do
        user = build :user, password: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:password)
      end

      it "password_confirmation is required" do
        user = build :user, password_confirmation: nil

        expect(user).to_not be_valid
        expect(user.errors.keys).to include(:password_confirmation)
      end

      it "username and email are both unique" do
        create :user
        user2 = build :user

        expect(user2).to_not be_valid
        expect(user2.errors.keys).to include(:username)
        expect(user2.errors.keys).to include(:email)
        expect(User.all.count).to eq 1
      end
    end
  end
end
