require 'rails_helper'

RSpec.describe Ingredient, type: :model do
    describe "model attributes" do
      before :each do
        @ingredient = build :ingredient
      end

      it "has a name attribute" do

        expect(@ingredient.name).to eq("MyString")
      end

      it "has an image attribute" do
        # read documentation for this one
      end

    end

    describe "model validations" do

    end
  end
