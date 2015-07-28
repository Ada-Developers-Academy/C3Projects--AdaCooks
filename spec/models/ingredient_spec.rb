require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe "model validations" do
    it "will not save without a name" do

      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "requires a unique name" do
      ingredient =     build :ingredient, name: "yams"
      ingredientsame = build :ingredient, name: "yams"

      expect(ingredientsame).to_not be_valid
      expect(ingredientsame.errors.keys).to include(:name)
    end
  end
end
