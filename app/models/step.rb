class Step < ActiveRecord::Base
  belongs_to :recipe
  has_many :measurements, dependent: :destroy

  scope :by_number, -> { order(:number) }

  def has_measurements?
    measurements.count > 0
  end

  def self.new_step(create_params, recipe)
    step = Step.new(create_params)
    step.recipe_id = recipe.id
    step.number = recipe.next_step_number

    return step
  end
end
