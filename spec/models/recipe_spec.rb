require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it "requires that a name be present" do
      recipe = build :recipe, name: nil
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :name
    end

    context "name uniqueness" do
      before :each do
        create :recipe
      end

      it "requires that a name be unique" do
        recipe = build :recipe
        expect(recipe).to_not be_valid
        expect(recipe.errors.keys).to include :name
      end

      it "allows a recipe with a unique name" do
        recipe = build :recipe, name: "sweet cream ice cream"
        recipe.valid?
        expect(recipe.errors.keys).to_not include :name
      end
    end

    it "requires that a preparation be present" do
      recipe = build :recipe, preparation: nil
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :preparation
    end

    it "requires that a user_id be present" do
      recipe = build :recipe, user_id: nil
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :user_id
    end

    it "does not require a description" do
      recipe = build :recipe, description: nil
      recipe.valid?
      expect(recipe.errors.keys).to_not include :description
    end

    it "does not require an image" do
      recipe = build :recipe, image: nil
      recipe.valid?
      expect(recipe.errors.keys).to_not include :image
    end
  end
end
