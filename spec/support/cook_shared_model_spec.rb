require 'spec_helper'

RSpec.shared_examples "an object" do
  let (:object) { described_class.new }

  describe "model validations" do
    it "Requires that an object name be present" do

      expect(object).to_not be_valid
      expect(object.errors.keys).to include(:name)
    end
  end
end
