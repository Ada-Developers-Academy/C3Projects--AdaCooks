require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  describe "model validations" do
    it "requires a name" do
      cookbook = build :cookbook, name: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:name)
    end

    it "must be associated with a user" do
      cookbook = build :cookbook, user_id: nil

      expect(cookbook).to_not be_valid
      expect(cookbook.errors.keys).to include(:user_id)
    end
  end
end
