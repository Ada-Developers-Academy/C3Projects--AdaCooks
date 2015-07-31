require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "requires a name" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

    it "creates a new instance" do
      cookbook = build :cookbook

      expect(cookbook).to be_valid
      expect(cookbook.errors.keys).to_not include(:name)
    end
  end
end
