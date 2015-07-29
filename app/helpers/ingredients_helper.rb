module IngredientsHelper
  def ingredient_recipes_count(ingredient)
    output = "(in #{ ingredient.recipes.count } recipe"
    output += "s" unless ingredient.recipes.count == 1
    output += ")"
  end

  def random_ingredient_name
    Ingredient.all.sample.name
  end
end
