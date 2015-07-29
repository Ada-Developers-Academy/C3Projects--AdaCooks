require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # before(:each) do
  #   @recipe = Recipe.create(id: 1, name: "Soup", preparation: "Stir It")
  #   @ingredient = Ingredient.create(id: 1)
  # end
  #
  # after(:each) do
  #   @recipe.destroy
  # end

  describe "recipe model validations" do
    it "must have one or more order ingredients" do
      recipe = build :recipe
      ingredient = build :ingredient
      recipe.ingredients << ingredient

      expect(recipe).to be_valid
    end

    it "Requires that a name must be present" do
      recipe2 = build :recipe, name: nil

      expect(recipe2).to_not be_valid
      expect(recipe2.errors.keys).to include(:name)
    end

    it "Requires that a preparation must be present" do
      recipe = build :recipe, preparation: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:preparation)
    end

  end

end
