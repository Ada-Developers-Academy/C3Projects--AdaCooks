module RecipesHelper
  def recipe_ingredients_count(recipe) # FIXME: test recipe_ingredients_count
    output = "(#{ recipe.ingredients.count } ingredient"
    output += "s" unless recipe.ingredients.count == 1
    output += ")"
  end
end
