module CookbooksHelper
  def cookbook_recipes_count(cookbook)
    output = "in #{ cookbook.recipes.count } recipe"
    output += "s" unless cookbook.recipes.count == 1
    output += ""
  end

  def cookbook_ingredients_count(cookbook)
    ingredient_count = cookbook.uniq_ingredients

    output = "#{ingredient_count} unique ingredient"
    output += "s" unless ingredient_count == 1
    output += ""
  end
end
