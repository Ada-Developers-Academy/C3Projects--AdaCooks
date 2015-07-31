require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CookbooksHelper. For example:
#
# describe CookbooksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CookbooksHelper, type: :helper do
  let(:cookbook) { create :cookbook }
  let(:recipe1) { create :recipe }
  let(:recipe2) { create :recipe }
  let(:recipe3) { create :recipe }

  describe "cookbook_recipes_count" do
    it "outputs some text based on how many recipes an ingredient is used in" do
      cookbook.recipes << recipe1
      cookbook.recipes << recipe2
      expect(cookbook_recipes_count(cookbook)).to include("2")

      recipe3
      expect(cookbook_recipes_count(cookbook)).not_to include("3")
    end

    it "adjusts the pluralization if there's only one ingredient" do
      cookbook.recipes << recipe1
      expect(cookbook_recipes_count(cookbook)).not_to include("s")

      cookbook.recipes << recipe2
      expect(cookbook_recipes_count(cookbook)).to include("s")
    end
  end
end
