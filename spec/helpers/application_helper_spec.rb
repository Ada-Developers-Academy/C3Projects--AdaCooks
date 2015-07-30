require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#format_date" do
    let (:date_string) { "June 20th, 2086" }
    let (:invalid_dates) {["potato farmer", date_string]}
    let (:valid_dates) {[
      Date.parse(date_string), Time.parse(date_string), DateTime.parse(date_string)
    ]}

    it "takes in a date/time-feeling object and outputs a string" do
      invalid_dates.each do |date|
        expect{ format_date(date) }.to raise_exception(NoMethodError)
      end

      valid_dates.each do |date|
        expect(format_date(date).class).to eq(String)
      end
    end

    it "outputs a more user-friendly date with a month and year" do
      valid_dates.each do |date|
        expect(format_date(date)).to eq("June 2086")
      end
    end
  end

  describe "#random_profession_name" do
    let(:professions) {[
      "doctors", "dentists", "psychiatrists", "engineers", "bus drivers",
      "artists", "musicians", "grad students", "professors", "teachers",
      "lifeguards", "firefighters", "nurses", "architects", "video game testers",
      "programmers", "elephants", "giraffes", "pilots", "stewards",
      "most children", "superheroes", "librarians", "actors", "scientists"
    ]}

    # FIXME: is this really the right way to test #random_profession_name? -J
    it "selects a random profession" do
      expect(professions).to include(random_profession_name.downcase)
    end
  end


end
