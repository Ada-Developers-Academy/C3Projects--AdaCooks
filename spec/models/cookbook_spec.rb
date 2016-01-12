require 'rails_helper'

RSpec.describe Cookbook, type: :model do
  let(:new_book) { create :cookbook }
  let(:nil_name) { build :cookbook, name: nil }

  describe "model validations" do
    it "requires a name to be present" do
      expect(nil_name).to be_invalid
      expect(nil_name.errors.keys).to include(:name)
    end

    it "cookbook is valid" do
      expect(new_book).to be_valid
    end

    it "requires name to be unique" do
      create :cookbook
      dup_book = build :cookbook, name: "Book Name"

      expect(dup_book).to be_invalid
      expect(dup_book.errors.keys).to include(:name)
    end
  end

end
