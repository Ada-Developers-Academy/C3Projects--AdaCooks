require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "database relationships" do
    pending "belongs to a user"
    pending "has and belongs to many recipes"
  end

  describe "model validations" do
    pending "name validations"
    pending "avatar validations"
    pending "user_id validations"
  end

  describe "scopes" do
    it "can grab ingredients in :alphabetized order" do
      ingredient1 = create :ingredient, name: "apple"
      ingredient2 = create :ingredient, name: "coffee"
      ingredient3 = create :ingredient, name: "broccoli"
      ingredient4 = create :ingredient, name: "banana"
      ingredient5 = create :ingredient, name: "aardvark"
      correct_order = [ingredient5, ingredient1, ingredient4, ingredient3, ingredient2]

      expect(Ingredient.alphabetized).to eq(correct_order)
      # OPTIMIZE: is the following line the best way to check this?
      expect(Ingredient.alphabetized.map { |ing| ing.id }).not_to eq(["1", "2", "3", "4", "5"])
    end
  end
end
