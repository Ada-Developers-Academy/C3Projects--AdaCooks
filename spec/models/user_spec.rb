require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "creates valid users" do
      create :user

      expect(User.count).to eq(1)
    end

    it "requires a name" do
      user = build :user, name: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      create :user, name: "bob"
      bob2 = build :user, name: "bob"

      expect(bob2).to_not be_valid
      expect(bob2.errors.keys).to include(:name)
    end

    it "requires an email" do
      user = build :user, email: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:email)
    end

    it "requires a unique email" do
       create :user, email: "haha@lol.com"
       joker = build :user, email: "haha@lol.com"

      expect(joker).to_not be_valid
      expect(joker.errors.keys).to include(:email)
    end

    it "requires a password" do
      user = build :user, password: nil

      expect(user).to_not be_valid
      expect(user.errors.keys).to include(:password)
    end
  end # validations

  describe "associations" do
    it "has many cookbooks" do
      user = create :user, id: 1
      healthy = create :cookbook, name: "healthy", user_id: 1
      unhealthy = create :cookbook, name: "unhealthy", user_id: 1

      expect(user.cookbooks).to include(healthy, unhealthy)
    end

    it "has many recipes" do
      user = create :user, id: 1
      stone_soup = create :recipe, name: "stone soup", user_id: 1
      earth_worms = create :recipe, name: "earth worms", user_id: 1

      expect(user.recipes).to include(earth_worms, stone_soup)
    end

    it "has many ingredients" do
      user = create :user, id: 1
      h2o = create :ingredient, name: "water", user_id: 1
      co = create :ingredient, name: "carbon monoxide", user_id: 1

      expect(user.ingredients).to include(h2o, co)
    end

  end # associations
end
