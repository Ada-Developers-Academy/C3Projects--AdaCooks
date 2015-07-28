require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it "requires that a name be present" do
      recipe = build :recipe, name: nil
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :name
    end
  end
end
