class Measurement < ActiveRecord::Base
  # Validations ----------------------------------------------------------------
  validates :unit, presence: true
end
