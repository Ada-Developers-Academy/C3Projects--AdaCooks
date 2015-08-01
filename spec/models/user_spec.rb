require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    it "has_many cookbooks" do
      expect(User.reflect_on_association(:cookbooks).macro).to eq(:has_many)
    end

    it "has_many recipes" do
      expect(User.reflect_on_association(:recipes).macro).to eq(:has_many)
    end

    it "has_many ingredients" do
      expect(User.reflect_on_association(:ingredients).macro).to eq(:has_many)
    end
  end
end

