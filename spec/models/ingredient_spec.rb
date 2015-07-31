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
      expect(same_ingredient.errors.keys).to include (:name)
    end
  end

  describe "scope" do
    let(:ingredient1) {create :ingredient}
    let(:ingredient2) {create :ingredient, name: "spice"}
    let(:ingredient3) {create :ingredient, name: "everything nice"}

    it "sorts all the ingredients by alphabetical order" do
      ingredient2
      correct_order = [ingredient3, ingredient2, ingredient1]
      expect(Ingredient.organize).to eq(correct_order)
    end
  end
end
