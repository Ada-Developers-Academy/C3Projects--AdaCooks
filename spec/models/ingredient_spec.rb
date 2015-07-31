require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context "name validation" do
    let(:pine)  {create :ingredient}
    let(:pine2) {create :ingredient}

    # + case
    it "creates ingredient if name is present" do
      expect(pine).to be_valid
    end

    # - case
    it "requires ingredient name to be present" do
      pine = build :ingredient, name: nil

      expect(pine).to_not be_valid
      expect(pine.errors.keys).to include(:name)
    end

    it "requires a name to be unique" do
      pine
      another_pine = pine.dup
      another_pine.save

      expect(another_pine.errors.keys).to include(:name)
    end
  end

  describe "alphabet scope" do
    let(:ingredient1) { create :ingredient, name: "Jerky"}
    let(:ingredient2) { create :ingredient, name: "Bacon"}
    let(:ingredient3) { create :ingredient, name: "Pineapple"}
    let(:ingredient4) { create :ingredient, name: "Apple"}

    it "orders ingredients alphabetically" do
      ingredient2
      order = [ingredient4, ingredient2, ingredient1, ingredient3]
      expect(Ingredient.all.alphabet).to eq(order)
    end
  end
end
