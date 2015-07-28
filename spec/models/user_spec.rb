require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "creates valid users" do
      create :user

      expect(User.count).to eq(1)
    end

    it "doesn't create invalid users" do
      user = build :user, name: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:name)
    end
  end # validations

  describe "associations" do
    it "has many cookbooks" do
      user = create :user, id: 1
      create :cookbook, user_id: 1

      expect(user.cookbooks.count).to eq(1)
    end

    it "has many recipes" do
      user = create :user, id: 1
      create :recipe, user_id: 1

      expect(user.recipes.count).to eq(1)
    end

    it "has many ingredients" do
      user = create :user, id: 1
      create :ingredient, user_id: 1

      expect(user.ingredients.count).to eq(1)
    end

  end # associations
end
