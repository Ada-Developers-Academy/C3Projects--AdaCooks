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
end
