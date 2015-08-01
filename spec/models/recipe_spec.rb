require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it "requires that a name be present" do
      recipe = build :recipe, name: nil
      recipe.valid?
      expect(recipe.errors.keys).to include :name
    end

    context "name uniqueness" do
      before :each do
        create :recipe
      end

      it "requires that a name be unique" do
        recipe = build :recipe
        recipe.valid?
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
      recipe.valid?
      expect(recipe.errors.keys).to include :preparation
    end

    it "requires that a user_id be present" do
      recipe = build :recipe, user_id: nil
      recipe.valid?
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

  context "scopes" do
    before :each do
      @recipe1 = create :recipe
      @recipe2 = create :recipe, name: "sand"
      @recipe3 = create :recipe, name: "mystery jelly bean"
    end

    it "selects the two newest receipes" do
      correct_order = [@recipe3, @recipe2]
      expect(Recipe.newest(2)).to eq correct_order
    end

    it "alphabetizes recipes" do
      expect(Recipe.alpha.first).to eq @recipe3
    end
  end
end
