require 'rails_helper'

RSpec.describe User, type: :model do
  describe "database relationships" do
    let(:user) { create :user }
    let(:cookbook) { create :cookbook, user_id: user.id }
    let(:recipe) { create :recipe, user_id: user.id }
    let(:ingredient) { create :ingredient, user_id: user.id }

    it "has many cookbooks" do
      expect(user.cookbooks).to include(cookbook)
    end

    it "has many recipes" do
      expect(user.recipes).to include(recipe)
    end

    it "has many ingredients" do
      expect(user.ingredients).to include(ingredient)
    end
  end

  describe "model validations" do
    context "username" do
      it "requres a username to be valid" do
        invalid_user = build :user, username: nil
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.keys).to include(:username)

        valid_user = build :user, username: "bramblefreck"
        expect(valid_user).to be_valid
        expect(valid_user.errors.keys).not_to include(:username)
      end

      it "must have a unique username" do
        valid_user = create :user, username: "bramblefreck"
        expect(valid_user).to be_valid
        expect(valid_user.errors.keys).not_to include(:username)

        invalid_user = build :user, username: "bramblefreck"
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.keys).to include(:username)
      end
    end

    context "email" do
      it "requres an email to be valid" do
        invalid_user = build :user, email: nil
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.keys).to include(:email)

        valid_user = build :user, email: "strongbad@homestarrunner.com"
        expect(valid_user).to be_valid
        expect(valid_user.errors.keys).not_to include(:email)
      end

      it "must have a unique email" do
        valid_user = create :user, email: "strongbad@homestarrunner.com"
        expect(valid_user).to be_valid
        expect(valid_user.errors.keys).not_to include(:email)

        invalid_user = build :user, email: "strongbad@homestarrunner.com"
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.keys).to include(:email)
      end
    end

    context "password_digest" do
      it "requires a password_digest to be valid" do
        invalid_user = build :user, password_digest: nil
        expect(invalid_user).not_to be_valid
        expect(invalid_user.errors.keys).to include(:password_digest)

        valid_user = build :user, password_digest: "trogdor the burninator"
        expect(valid_user).to be_valid
        expect(valid_user.errors.keys).not_to include(:password_digest)
      end
    end
  end

  describe "instance methods" do
    context "#has_ingredients?" do
    end

    context "#has_recipes?" do
    end
  end
end
