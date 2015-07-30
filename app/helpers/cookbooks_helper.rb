module CookbooksHelper
  def cookbook_recipes_count(cookbook) # FIXME: test probably broken?
    output = "in #{ cookbook.recipes.count } recipe"
    output += "s" unless cookbook.recipes.count == 1
    output += ""
  end

  def cookbook_ingredients_count(cookbook) # FIXME: test probably broken?
    recipes = cookbook.recipes

    all_ingredients = []
    recipes.each do |recipe|
      all_ingredients.push(recipe.ingredients)
    end

    ingredient_count = all_ingredients.flatten.uniq.count

    output = "#{ ingredient_count} unique ingredient"
    output += "s" unless ingredient_count == 1
    output += ""
  end
end
