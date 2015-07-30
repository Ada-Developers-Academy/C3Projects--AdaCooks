class Measurement < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :step
  belongs_to :ingredient
end
