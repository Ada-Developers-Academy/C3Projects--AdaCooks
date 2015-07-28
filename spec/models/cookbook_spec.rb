require 'rails_helper'

RSpec.describe Cookbook, type: :model do
<<<<<<< HEAD
  # pending "add some examples to (or delete) #{__FILE__}"
end
=======
    before :each do
      @cookbook = build :cookbook, id: 1, user_id: 1
    end

    describe "model attributes" do

      it "has a name attribute" do
        expect(@cookbook.name).to eq("MyString")
      end

      it "has a description attribute" do
        expect(@cookbook.description).to eq("MyText")
      end
    end

    describe "model associations" do

      it "is associated with a user" do
        expect(@cookbook.user_id).to eq(1)
      end

      it "is associated with recipes" do
        recipe = create :recipe, id: 1, name: "A recipe", cookbooks: [@cookbook]

        expect(recipe.cookbooks).to include(@cookbook)
      end

      it "has many ingredients through recipes" do
        ingredient = create :ingredient, id: 1, name: "Eggplant"

        recipe = create :recipe, id: 1, name: "Another recipe", ingredients: [ingredient], cookbooks: [@cookbook]

        expect(@cookbook.ingredients).to include(ingredient)
      end
    end

    describe "model validations" do
      it "has to have a name" do
        cookbook = build :cookbook, name: nil

        expect(cookbook).to_not be_valid
        expect(cookbook.errors.keys).to include(:name)
      end

      it "name has to be unique" do
        cookbook1 = create :cookbook, name: "Awesome Cookbook"

        cookbook2 = build :cookbook, name: "Awesome Cookbook"

        expect(cookbook2).to_not be_valid
        expect(cookbook2.errors.keys).to include(:name)
      end
    end
  end
>>>>>>> d07e2e83622366d5a534cb0a3401d3389e61d275
