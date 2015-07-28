require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do

  context "validations" do
    it "requires recipe_id to be present" do
      association = build :recipe_ingredient, recipe_id: nil
      association.valid? # This ensures that the errors hash gets populated
      expect(association.errors.keys).to include :recipe_id
    end

    it "requires ingredient_id to be present" do
      association = build :recipe_ingredient, ingredient_id: nil
      association.valid? # This ensures that the errors hash gets populated
      expect(association.errors.keys).to include :ingredient_id
    end
  end
end
