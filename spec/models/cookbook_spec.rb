require 'rails_helper'

RSpec.describe Cookbook, type: :model do
    describe "model attributes" do
      before :each do
        @cookbook = build :cookbook
      end

      it "has a name attribute" do

        expect(@cookbook.name).to eq("MyString")
      end

      it "has a description attribute" do

        expect(@cookbook.description).to eq("MyText")
      end

      it "is associated with recipes" do
        # read factory girl documentation for this
      end
    end
  end
