require 'rails_helper'

RSpec.describe Measurement, type: :model do
  context "validations" do
    it "requires that a unit be present" do
      measurement = build :measurement, unit: nil
      measurement.valid?
      expect(measurement.errors.keys).to include :unit
    end

    it "requires that a unit be unique" do
      create :measurement
      measurement = build :measurement # duplicate :unit
      measurement.valid?
      expect(measurement.errors.keys).to include :unit
    end

    it "allows a uniquely named unit" do
      create :measurement
      measurement = build :measurement, unit: "spoonful"
      measurement.valid?
      expect(measurement.errors.keys).to_not include :unit
    end
  end
end
