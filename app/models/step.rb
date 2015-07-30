class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :measurements

  def has_measurements?
    measurements.count > 0
  end
end
