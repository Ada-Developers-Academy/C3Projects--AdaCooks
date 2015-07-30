require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  context "validations" do
    it "requires that a name be present" do
      cookbook = build :cookbook, name: nil
      cookbook.valid?
      expect(cookbook.errors.keys).to include :name
    end

    it "requires that a user_id be present" do
      cookbook = build :cookbook, user_id: nil
      cookbook.valid?
      expect(cookbook.errors.keys).to include :user_id
    end

    it "does not require a description" do
      cookbook = build :cookbook, description: nil
      cookbook.valid?
      expect(cookbook.errors.keys).to_not include :description
    end
  end

  context "scopes" do
    it "sorts alphabetically" do
      cookbook1 = create :cookbook, name: 'b name'
      cookbook2 = create :cookbook, name: 'a name'
      correct_order = [cookbook2, cookbook1]
      expect(Cookbook.alphabetical).to eq correct_order
    end
  end
end
