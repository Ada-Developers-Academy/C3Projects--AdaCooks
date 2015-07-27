require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context "validations" do
    it "requires that a name be present" do
      ingredient = build :ingredient, name: nil
      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include :name
    end

    it "requires that a name be unique" do
      create :ingredient
      ingredient2 = build :ingredient # record with duplicate name
      expect(ingredient2).to_not be_valid
      expect(ingredient2.errors.keys).to include :name
    end

    # negative test
    it "allows a uniquely named ingredient" do
      create :ingredient
      ingredient2 = build :ingredient, name: "vanilla" # record with unique name
      expect(ingredient2.errors.keys).to_not include :name
    end
  end
end
