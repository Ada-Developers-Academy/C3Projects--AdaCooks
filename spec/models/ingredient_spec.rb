require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context "name validation" do
    let(:pine) {create :ingredient}
    let(:pine2) {build :ingredient}

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
      pine2
      expect(pine2.errors.keys).to include(:name)
      # I don't know why above isn't working
      expect(pine2).to_not be_valid
    end
  end # name validation

  # context "alpha scope" do
  #   before(:each) do
  #     @j = create(:ingredient, name: "Jerky"),
  #     @b = create(:ingredient, name: "Bacon"),
  #     @p = create(:ingredient),
  #     @a = create(:ingredient, name: "Apple")
  #
  #   end
  #   it "orders ingredients alphabetically" do
  #     order = [@a, @b, @j, @p]
  #     expect(Ingredient.all.alphabet).to eq(order)
  #   end
  # end
end # describe
