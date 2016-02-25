require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "validations" do
    it "requires a name" do
      cookbook = build(:cookbook, name: "")
      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end
  end
end
