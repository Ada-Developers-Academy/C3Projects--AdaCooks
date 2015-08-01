require 'rails_helper'

RSpec.describe Recipe, type: :model do

  describe "model validations" do
    it "has and belongs to many cookbooks" do
      expect(Recipe.reflect_on_association(:cookbooks).macro).to eq(:has_and_belongs_to_many)
    end

    it "A recipe must have a name" do
      recipe= Recipe.create(name: "", description: "tiny bite size pieces")
      recipe.save
      expect(recipe).to_not be_valid

    end

    it "has and belongs to many ingredients" do
      expect(Recipe.reflect_on_association(:ingredients).macro).to eq(:has_and_belongs_to_many)
    end

    it "belongs_to user" do
      expect(Recipe.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end

  describe "search query" do
    it "returns recipes whose names include query input" do

      Recipe.create(name: "Chicken Soup")
      Recipe.create(name: "Chicken Tacos")
      Recipe.create(name: "Chocolate Cake")

      expect(Recipe.search("chicken").count).to eq(2)
      expect(Recipe.search("cake").count).to eq(1)
      expect(Recipe.search("c").count).to eq(3)
    end
  end

end
