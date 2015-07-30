require 'rails_helper'

RSpec.describe Step, type: :model do
  describe "#has_measurements?" do
    let(:step) { create(:step) }

    it "returns true when a step has measurements" do
      measurement = create(:measurement, step: step)

      expect(step.has_measurements?).to eq(true)
    end

    it "returns false when a step has no measurements" do
      expect(step.has_measurements?).to eq(false)
    end
  end
end
