require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context "name validation" do
    let(:pine) {create :ingredient}

    it "requires ingredient name to be present" do
      pine = build :ingredient, name: nil

      expect(pine).to_not be_valid
      expect(pine.errors.keys).to include(:name)
    end

    it "requires a name to be unique" do
      pine
      pine2 = build :ingredient

      expect(pine2.errors.keys).to include(:name)
      expect(pine2).to_not be_valid
    end
  end
end # describe
