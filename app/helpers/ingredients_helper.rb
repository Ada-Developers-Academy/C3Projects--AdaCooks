module IngredientsHelper
  def ingredient_recipes_count(ingredient) # FIXME: test ingredient_recipes_count
    output = "(in #{ ingredient.recipes.count } recipe"
    output += "s" unless ingredient.recipes.count == 1
    output += ")"
  end
end
