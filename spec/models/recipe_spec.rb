require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "database relationships" do
    it "belongs to a user" do
      recipe = build :recipe
      user = build :user

      expect(recipe.user).to eq(user)
    end

    pending "has and belongs to many ingredients"
    pending "has and belongs to many cookbooks"
  end

  describe "model validations" do
    pending "name validation"
    pending "steps validation"
    pending "description validation"
    pending "avatar/image"
    pending "user_id validations"
  end
end
