require 'rails_helper'

RSpec.describe Ingredient, type: :model do

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

    end

    describe "model validations" do

    end

  end
