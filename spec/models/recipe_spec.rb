require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "associations" do
    before :each do
      @recipe = create(:recipe)
    end

    it "belongs to a user" do
      expect(@recipe.user_id).to eq 1
    end

    it "has_and_belongs_to_many ingredients" do
      expect(@recipe.ingredients.count).to eq 1
      expect(@recipe.ingredients.first.name).to eq "yams"
    end

    it "has_and_belongs_to_many cookbooks" do
      cookbook = create :cookbook
      cookbook.recipes << @recipe

      expect(cookbook.recipes.count).to eq 1
      expect(cookbook.recipes.first.name).to eq "Delicious Food"
      expect(@recipe.cookbooks.count).to eq 1
      expect(@recipe.cookbooks.first.name).to eq "Snacks"
    end
  end

  describe "validations" do
    it "requires a name" do
      invalid_recipe = build :recipe, name: ""

      expect(invalid_recipe).to_not be_valid
      expect(invalid_recipe.errors.keys).to include(:name)
    end

    it "requires a preparation" do
      invalid_recipe = build :recipe, preparation: nil

      expect(invalid_recipe).to_not be_valid
      expect(invalid_recipe.errors.keys).to include(:preparation)
    end
  end

  describe "scopes" do
    describe "self.alpha_order" do
      it "sorts the recipes in alphabetical order by name" do
        %w(Happy Lovely Pig Darling Appetite Bumpkin).each do |name|
          recipe = Recipe.new(name: name, preparation: "as;lkdfj")
          recipe.ingredients << Ingredient.new(name: name)
          recipe.save
        end

        expect(Recipe.alpha_order.first.name).to eq "Appetite"
      end
    end
  end
end
