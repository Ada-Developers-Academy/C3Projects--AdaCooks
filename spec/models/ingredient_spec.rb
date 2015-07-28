require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe "model validations" do
    it "Requires that an ingredient name be present" do
      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "Requires that an ingredient name be unique" do
      ingredient = create :ingredient
      other_ingredient = ingredient.dup

      expect(other_ingredient).to_not be_valid
      expect(other_ingredient.errors[:name]).to include("has already been taken")
    end
  end

  describe "scope alpha_order" do
    it "Returns a list of ingredients in alphabetic order" do
      ingredient1 = create :ingredient, name: "Almond"
      ingredient2 = create :ingredient, name: "Chicken"
      ingredient3 = create :ingredient, name: "Bacon"

      correct_order = [ingredient1, ingredient3, ingredient2]

      expect(Ingredient.alpha_order).to eq correct_order
    end
  end
end
