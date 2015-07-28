require 'rails_helper'

RSpec.describe Ingredient, type: :model do
<<<<<<< HEAD
  # pending "add some examples to (or delete) #{__FILE__}"
end
=======

    before :each do
      @ingredient = build :ingredient, user_id: 1
    end

    describe "model attributes" do

      it "has a name attribute" do
        expect(@ingredient.name).to eq("MyString")
      end

      it "has an image attribute" do
        # read documentation for this one
      end
    end

    describe "model associations" do

      it "is associated with a user" do
        expect(@ingredient.user_id).to eq(1)
      end

      it "is associated with a recipe" do
        recipe = create :recipe, name: "A recipe", ingredients: [@ingredient]

        expect(@ingredient.recipes).to include(recipe)
      end
    end

    describe "model validations" do
      it "has to have a name" do
        ingredient = build :ingredient, name: nil

        expect(ingredient).to_not be_valid
        expect(ingredient.errors.keys).to include(:name)
      end

      it "name has to be unique" do
        ingredient1 = create :ingredient, name: "An ingredient"

        ingredient2 = build :ingredient, name: "An ingredient"

        expect(ingredient2).to_not be_valid
        expect(ingredient2.errors.keys).to include(:name)
      end
    end

  end
>>>>>>> d07e2e83622366d5a534cb0a3401d3389e61d275
