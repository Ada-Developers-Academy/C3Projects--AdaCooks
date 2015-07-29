require 'rails_helper'

RSpec.describe Measurement, type: :model do
  context "validations" do
    it "requires that a name be present" do
      measurement = build :measurement, unit: nil
      measurement.valid?
      expect(measurement.errors.keys).to include :unit
    end
  end
end
