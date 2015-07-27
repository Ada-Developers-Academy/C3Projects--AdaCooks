require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "model validations" do
    it "requires a name" do
      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "name bust be unique" do
      let(:ingredient1) { create :ingredient }
      let(:ingredient2) { create :ingredient }

      expect(ingredients.count).to eq 1
      expect(ingredient2).to_not be_valid
    end
  end # end describe
end #end class
