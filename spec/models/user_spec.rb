require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    before :each do
      @user = create(:user)
    end

    it "has_many cookbooks" do
      10.times do
        create(:cookbook)
      end

      expect(@user.cookbooks.count).to eq 10
    end

    it "has_many recipes" do
      create(:recipe)

      expect(@user.recipes.count).to eq 1
    end

    it "has_many ingredients" do
      %w(apple carrot onion pepper pumpkin).each do |ingredient_name|
        create(:ingredient, name: ingredient_name)
      end

      expect(@user.ingredients.count).to eq 5
    end
  end

  describe "validations" do
    let(:valid_user) { build(:user) }

    describe "username" do
      let(:invalid_username) { build(:user, name: nil) }

      it "requires a username" do
        expect(valid_user).to be_valid
      end

      it "requires a unique username" do
        create(:user)

        expect(valid_user).to_not be_valid
      end
    end

    describe "password" do
      let(:invalid_password) { build(:user, password: "1234") }

      it "requires a password and password_confirmation" do
        expect(invalid_password).to_not be_valid
      end
    end
  end
end
