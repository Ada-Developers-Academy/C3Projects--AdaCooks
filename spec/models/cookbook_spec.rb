require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "requires a name" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      cookbook = create :cookbook
      cookbook1 = build :cookbook, name: "Cookbook"

      expect(cookbook1).to_not be_valid
      expect(cookbook1.errors.keys).to include(:name)
      expect(Cookbook.count).to eq 1
    end
  end
end
