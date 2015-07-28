require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    # try this, not sure if it'll work. If not, run separately.
    [:name, :preparation].each do |required_attribute|
      it "requires #{required_attribute}" do
        recipe = build(:recipe, required_attribute: nil)

        expect(recipe).to_not be_valid
        expect(recipe.errors.keys).to include(required_attribute)
      end
    end

    it "must be associated with a user" do
      recipe = build(:recipe, user_id: nil)

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:user_id)
    end
  end
end
