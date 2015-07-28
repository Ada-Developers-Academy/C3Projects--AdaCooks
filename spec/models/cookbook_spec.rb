require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  context "validations" do
    it "requires that a name be present" do
      cookbook = build :cookbook, name: nil
      cookbook.valid?
      expect(cookbook.errors.keys).to include :name
    end
  end
end
