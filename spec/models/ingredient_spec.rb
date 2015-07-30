require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "scopes" do
    describe ".by_name" do
      let(:ingredient_a) { create(:ingredient, name: "a") }
      let(:ingredient_b) { create(:ingredient, name: "b") }
      let(:ingredient_c) { create(:ingredient, name: "c") }

      it "returns all ingredients in alphabetical order" do
        ingredient_b # need to create the records in the db out of alphabetical order
        ingredient_order = [ ingredient_a, ingredient_b, ingredient_c ]

        expect(Ingredient.by_name).to eq(ingredient_order)
      end
    end
  end
end
