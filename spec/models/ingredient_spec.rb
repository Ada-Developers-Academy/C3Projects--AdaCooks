require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "model validations" do
    it "has and belongs to many recipes" do
      expect(Ingredient.reflect_on_association(:recipes).macro).to eq(:has_and_belongs_to_many)
    end

    it "belongs_to user" do
      expect(Ingredient.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
    
    it "requires that an ingredient name be unique" do
      ingredient = Ingredient.create(name: "Basil")
      another_ingredient = ingredient.dup
      another_ingredient.save

      expect(another_ingredient).to_not be_valid
      expect(another_ingredient.errors.keys).to include(:name)
    end
  end

  describe "search query" do
    it "returns ingredients whose names include query input" do 

      Ingredient.create(name: "Shredded Chicken")
      Ingredient.create(name: "Baked Chicken")
      Ingredient.create(name: "Chocolate")

      expect(Ingredient.search("chicken").count).to eq(2)
      expect(Ingredient.search("chocolate").count).to eq(1)
      expect(Ingredient.search("c").count).to eq(3)
    end
  end

end
