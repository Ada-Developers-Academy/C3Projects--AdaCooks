require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "Requires that a cookbook name be present" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

     it "Requires that a cookbook name be present" do
      cookbook = build :cookbook

      expect(cookbook).to be_valid
     end
  end
end
