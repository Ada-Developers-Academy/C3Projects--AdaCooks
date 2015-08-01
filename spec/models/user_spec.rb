require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "requires that a username be present" do
      user = build :user, username: nil
      user.valid? # This ensures that the errors hash gets populated
      expect(user.errors.keys).to include :username
    end

    it "requires that a username be unique" do
      user = create :user
      total_poser = build :user, username: "freddie"
      total_poser.valid?
      expect(total_poser.errors.keys).to include :username
    end

    it "requires a password be present" do
      user = build :user, password: nil
      user.valid?
      expect(user.errors.keys).to include :password
    end

    it "requires a password_confirmation be present" do
      user = build :user, password_confirmation: nil
      user.valid?
      expect(user.errors.keys).to include :password_confirmation
    end

    it "requires matching password and password confirmation" do
      user = build :user, password_confirmation: "shazamablam!"
      user.valid?
      expect(user.errors.keys).to include :password_confirmation
    end
  end
end
