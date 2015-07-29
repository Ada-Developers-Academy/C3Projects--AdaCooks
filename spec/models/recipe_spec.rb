require 'rails_helper'

RSpec.describe Recipe, type: :model do
    before(:each) do
    @recipe = Recipe.create(id: 1, name: "Soup", preparation: "Stir It")
    @ingredient = Ingredient.create(id: 1)
    end

    after(:each) do
    @recipe.destroy
    end

  describe "recipe model validations" do

    it "must have one or more order ingredients" do
      @recipe.ingredients << @ingredient

    expect(@recipe).to be_valid
    end
  end

end
