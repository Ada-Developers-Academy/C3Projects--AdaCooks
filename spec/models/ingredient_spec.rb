require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  # presence and uniqueness of name
  describe "model validations" do
    it "requires a name" do
      ingredient = build :ingredient, name: nil

      expect(ingredient).not_to be_valid
      expect(ingredient.errors.keys).to include(:name)
    end

    it "name must be unique" do
      create :ingredient
      ingredient2 = build :ingredient

      expect(ingredient2).not_to be_valid
      expect(Ingredient.count).to be 1
      expect(ingredient2.errors.keys).to include(:name)
    end

    it "must be associated with a user" do
      ingredient = build :ingredient, user_id: nil

      expect(ingredient).not_to be_valid
      expect(ingredient.errors.keys).to include(:user_id)
    end
  end
end
