require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it "requires that a name be present" do
    ingredient = build :ingredient, name: nil
    # binding.pry
    expect(ingredient).to_not be_valid
    expect(ingredient.errors.keys).to include :name
  end
end
