require 'rails_helper'

RSpec.describe Cookbook, type: :model do

  describe "model validations" do
    it "has and belongs to many recipes" do
      expect(Cookbook.reflect_on_association(:recipes).macro).to eq(:has_and_belongs_to_many)
    end

    it "has_many ingredients" do
      expect(Cookbook.reflect_on_association(:ingredients).macro).to eq(:has_many)
    end

    it "belongs_to user" do
      expect(Cookbook.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
