require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  # + case
  it "creates cookbook if name is present" do
    cookbook1 = build :cookbook
    expect(cookbook1).to be_valid
  end
  # - case
  it "Requires that a name must be present" do
    cookbook1 = build :cookbook, name: nil

    expect(cookbook1).to_not be_valid
    expect(cookbook1.errors.keys).to include(:name)
  end
end
