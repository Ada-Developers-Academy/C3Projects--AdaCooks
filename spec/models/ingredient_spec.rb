require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "model validations" do
    let(:invalid_ingredient) {build :ingredient, name: nil}
    let(:ingredient1) {create :ingredient}

    it "requires a name" do
      expect(invalid_ingredient).to_not be_valid
      expect(invalid_ingredient.errors.keys).to include(:name)
    end

    it "name must be unique" do
      ingredient1
      same_ingredient = build :ingredient, name: "sugar"
      expect(same_ingredient).to_not be_valid
      
    end
  end
end
