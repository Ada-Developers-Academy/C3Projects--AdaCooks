class Recipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :cookbook
  belongs_to :user
end
