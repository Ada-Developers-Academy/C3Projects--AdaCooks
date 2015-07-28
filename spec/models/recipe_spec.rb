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
end
