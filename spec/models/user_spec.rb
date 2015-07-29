require 'rails_helper'

RSpec.describe User, type: :model do
  describe "database relationships" do
    # OPTIMIZE: these let statements by creating another factory for each
    let(:user) { create :user }
    let(:another_user) { create :user, username: "another_user", email: "another@user.user" }
    let(:cookbook) { create :cookbook, user_id: user.id }
    let(:another_cookbook) { create :cookbook, user_id: another_user.id }
    let(:recipe) { create :recipe, user_id: user.id }
    let(:another_recipe) { create :recipe, user_id: another_user.id }
    let(:ingredient) { create :ingredient, user_id: user.id }
    let(:another_ingredient) { create :ingredient, name: "another ingredient", user_id: another_user.id }

    it "has many cookbooks" do
      expect(user.cookbooks).to include(cookbook)
      expect(user.cookbooks).not_to include(another_cookbook)
    end

    it "has many recipes" do
      expect(user.recipes).to include(recipe)
      expect(user.recipes).not_to include(another_recipe)
    end

    it "has many ingredients" do
      expect(user.ingredients).to include(ingredient)
      expect(user.ingredients).not_to include(another_ingredient)
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
    let(:user) { create :user }
    let(:ingredient) { create :ingredient }
    let(:recipe) { create :recipe }

    context "#has_ingredients?" do
      it "returns true if a user has ingredients" do
        expect(user.ingredients).to include(ingredient)
        expect(user.has_ingredients?).to eq(true)
      end

      it "and false otherwise" do
        expect(user.has_ingredients?).to eq(false)
      end
    end

    context "#has_recipes?" do
      it "returns true if a user has recipes" do
        expect(user.recipes).to include(recipe)
        expect(user.has_recipes?).to eq(true)
      end

      it "and false otherwise" do
        expect(user.has_recipes?).to eq(false)
      end
    end
  end
end
