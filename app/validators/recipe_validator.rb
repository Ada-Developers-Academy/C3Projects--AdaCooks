class RecipeValidator < ActiveModel::Validator
  def validate(recipe)
    # Do nothing for now.
    # We must create an order before we create an order_item,
    # so the initial order must temporarily not have any order items
    unless recipe.ingredients.length >= 1
     recipe.errors.add(:ingredient, "recipe must have at least 1 ingredient")
    end
  end
end
