require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    # try this, not sure if it'll work. If not, run separately.
    it "requires a name" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires a preparation" do
      recipe = build :recipe, preparation: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:preparation)
    end

    it "must be associated with a user" do
      recipe = build(:recipe, user_id: nil)

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:user_id)
    end
  end

  describe "scopes" do
    it "orders recipes alphabetically" do
      recipe1 = create :recipe, name: "Zucchini Cassarole"
      recipe2 = create :recipe, name: "Albacore Tuna Salad"
      recipe3 = create :recipe, name: "Drunken Noodles"
      correct_order = [ recipe2, recipe3, recipe1 ]

      expect(Recipe.all.alpha_order).to eq correct_order
    end
  end
end
