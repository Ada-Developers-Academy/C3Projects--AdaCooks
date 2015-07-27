require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    it "requires a name to be present" do
      user = create :user, name: nil

      expect(user).to be_invalid
      expect(user.errors.keys).to include(:name)
    end
  end
end
