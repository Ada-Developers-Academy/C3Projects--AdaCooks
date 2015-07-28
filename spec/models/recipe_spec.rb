require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "scopes" do
    describe "self.alpha_order" do
      it "sorts the recipes in alphabetical order by name" do
        %w(Happy Lovely Pig Darling Appetite Bumpkin).each do |name|
          create(:recipe, name: name)
        end

        expect(Recipe.alpha_order.first.name).to eq "Appetite"
      end
    end
  end
end
