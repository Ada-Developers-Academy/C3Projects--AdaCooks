require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "model validations" do
    let(:recipe) {build :recipe, name: nil, prep: nil}

    it "requires a name" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires preparation instructions" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:prep)
    end

    it "requires ingredients" do
      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:ingredients)
    end
  end

  describe "methods" do
    before :each do
      @recipe1 = Recipe.new(name: "hi", prep: "bye")
      @recipe2 = Recipe.new(name: "bye", prep: "bye")
      @recipe3 = Recipe.new(name: "say", prep: "hello")
      [@recipe1, @recipe2, @recipe3].each do |recipe|
        recipe.save(validate: false)
      end
    end

    it "sorts all the recipes by alphabetical order" do
      correct_order = [@recipe2, @recipe1, @recipe3]
      expect(Recipe.organize).to eq(correct_order)
    end
  end

end
