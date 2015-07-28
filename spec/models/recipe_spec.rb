require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it "creates valid recipes" do
      create :recipe

      expect(Recipe.count).to eq(1)
    end

    it "requires a name" do
      recipe = build :recipe, name: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:name)
    end

    it "requires preparation instructions" do
      recipe = build :recipe, preparation: nil

      expect(recipe).to_not be_valid
      expect(recipe.errors.keys).to include(:preparation)
    end
  end # validations

  describe "associations" do
    it "belongs to a user" do
      chef = create :user, id: 1
      rad_recipe = create :recipe, user_id: 1

      expect(rad_recipe.user).to eq(chef)
    end

    it "is in a cookooks" do
      eastern_cookbook = create :cookbook, name: "eastern cookbook"
      western_cookbook = create :cookbook, name: "western cookbook"
      recipe = create :recipe, name: "east-west fusion", cookbooks: [eastern_cookbook, western_cookbook]

      expect(recipe.cookbooks).to include(western_cookbook, eastern_cookbook)
    end

    it "has ingredients" do
      apple = create :ingredient, name: "apple"
      banana = create :ingredient, name: "banana"
      recipe = create :recipe, name: "smoothie", ingredients: [banana, apple]

      expect(recipe.ingredients).to include(banana, apple)
    end



  end # associations
end # class Recipe
