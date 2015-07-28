# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


recipes = [

  {name: "Chocolate Coconut Milk Ice Cream", description: "Healthy yet decadent", preparation: "Combine all of the ingredients in a blender, and blend until smooth and creamy. Adjust the flavor to your taste, then transfer to a freezer-safe container. Place in the freezer for 4-6 hours, or until firm.", ingredients: "1 can coconut milk, 1/4 cup cocoa powder, 1/4 cup honey"
  },

  {name: "Yam Chips", description: "Yam Chips", preparation: "Slice yam in thin slices using mandolin. Toss with rest of ingredients. Lay flat on foil and put it in the oven. Bake until crispy.", ingredients: "1 yam, olive oil, sea salt, pepper"
  }

]

recipes.each do |recipe|
  Recipe.create recipe
end

ingredients = [

  {name: "Coconut Milk"},
  {name: "Cocoa Powder"},
  {name: "Honey"},
  {name: "Almond Butter"},
  {name: "Yams"},
  {name: "Vanilla Extract"},

]

ingredients.each do |ingredient|
  Ingredient.create ingredient
end


ingredients_recipes = {
  1 => [1, 2, 3, 4, 6],
  2 => [5],
}


recipe = Recipe.find(1)
recipe.ingredients << Ingredient.find(1)
recipe.ingredients << Ingredient.find(2)
recipe.ingredients << Ingredient.find(3)
recipe.ingredients << Ingredient.find(4)
recipe.ingredients << Ingredient.find(6)

recipe = Recipe.find(2)
recipe.ingredients << Ingredient.find(5)
