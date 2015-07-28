class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :measurements
end
