require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "model validations" do
    it "requires a name" do
      ingredient = build :ingredient, name: nil

      expect(ingredient).to_not be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "name must be unique" do
      ingredient1 = create :ingredient, name: "ingredient"
      ingredient2 = build :ingredient, name: "ingredient"
      expect(ingredient2).to_not be_valid
      expect(ingredient2.errors.keys).to include(:name)
      expect(Ingredient.count).to eq 1
    end
  end # end describe
end #end class


# build - news it up but doesn't save it
# create - news it up and saves it
