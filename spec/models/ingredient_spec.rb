require 'rails_helper'

RSpec.describe Ingredient, type: :model do
    describe "model validations" do
    it "requires a name" do
      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "requires name to be unique" do
      ingredient1 = create :ingredient
      
      # expect(create(:ingredient)).to_not be_valid
      expect(create(:ingredient)).to raise_error(ActiveRecord::RecordInvalid)
    end

    it "creates a new instance" do
      ingredient = build :ingredient

      expect(ingredient).to be_valid
      expect(ingredient.errors.keys).to_not include(:name)
    end
  end
end
