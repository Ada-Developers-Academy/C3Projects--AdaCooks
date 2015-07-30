module RecipesHelper
  def recipe_ingredients_count(recipe) # FIXME: test probably broken?
    output = "#{ recipe.ingredients.count } ingredient"
    output += "s" unless recipe.ingredients.count == 1
    output += ""
  end

  def random_recipe_name
    Recipe.all.sample.name
  end
end
