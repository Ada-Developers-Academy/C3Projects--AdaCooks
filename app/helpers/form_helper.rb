module FormHelper
  def setup_recipe(recipe)
    5.times { recipe.recipe_ingredients.build }
    recipe
  end
end
