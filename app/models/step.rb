class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :measurements

  def has_measurements? # TODO: test me!
    measurements.count > 0
  end
end
