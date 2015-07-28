class RecipeValidator < ActiveModel::Validator
    def validate(recipe)

    unless recipe.ingredients.count >= 1
      recipe.errors.add(:ingredient, "recipe must have at least one ingredient")
    end
  end
end
