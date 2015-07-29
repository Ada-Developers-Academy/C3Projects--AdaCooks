require 'rails_helper'

RSpec.describe Recipe, type: :model do

  # test associations?

  describe "validations" do
    it "requires a name" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :name
    end

    it "requires a description" do
      recipe = build :recipe, description: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :description
    end

    it "requires prep" do
      recipe = build :recipe, prep: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include :prep
    end
  end

  describe "scopes" do

    describe "#alphabetize" do
      before :each do
  			["E", "C", "B", "D", "F", "A"].each do |letter|
  				create :recipe, name: letter
  			end
  		end

      it "returns recipes in alphabetical order by name" do
        ordered_recipes = Recipe.alphabetize

        title_order = []
        ordered_recipes.each do |recipe|
          title_order << recipe.name
        end

        expect(title_order).to eq ["A", "B", "C", "D", "E", "F"]
      end

      it "returns all the recipes" do
        num_of_ordered_recipes = Recipe.alphabetize.count
        expect(num_of_ordered_recipes).to eq Recipe.count
      end
    end
  end
end
