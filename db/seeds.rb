users = [
  { username: "gurl", email: "gurl@example.com", password: "gurl", password_confirmation: "gurl", bio: "Just a midwest gurl." }
]

users.each do |user|
  User.create(user)
end

recipes = [
  { name: "Apple Crisp", description: "Yummy, cinnamony goodness!", user_id: 1 }, # OPTIMIZE: I don't like using the explicit ID. Is there a better way to handle this?
  { name: "Oreo Ice Cream", description: "Delicious on a hot day!", user_id: 1 },
  { name: "Brownies", description: "Delicious on a cold day!", user_id: 1 }
]

recipes.each do |recipe|
  Recipe.create(recipe)
end

ingredients = [
  { name: "Apples" }, # id: 1
  { name: "Cinnamon" }, # id: 2
  { name: "White Sugar" }, # id: 3
  { name: "Rolled Oats" }, # id: 4
  { name: "Olive Oil" }, # id: 5
  { name: "Milk" }, # id: 6
  { name: "Oreos" }, # id: 7
  { name: "Vanilla Extract" }, # id: 8
  { name: "Butter" }, # id: 9
  { name: "Eggs" }, # id: 10
  { name: "Unsweetend Cocoa Powder" }, # id: 11
  { name: "Whole Wheat Flour" }, # id: 12
  { name: "Salt" }, # id: 13
  { name: "Baking Powder" }, # id: 14
  { name: "Honey" }, # id: 15
  { name: "Powdered Sugar" } # id: 16
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

steps = [
# apple crisp
  { recipe_id: 1, number: 1, directions: "Mix together, preferably with a fork." },
  { recipe_id: 1, number: 2, directions: "Mix with above." },
  { recipe_id: 1, number: 3, directions: "Chop, putting into the 9x9 glass pan as you work. (Stop whenever the height looks good… don’t want it too close to the top or it’ll bubble over, but note that the topping won’t add much height (if any).)" },
  { recipe_id: 1, number: 2, directions: "Add to the apples and mix well." },
  { recipe_id: 1, number: 2, directions: "Add the crumbs/topping on the top. Pack down so it’s smooth all the way across." },
  { recipe_id: 1, number: 2, directions: "Bake in oven at 350 for ~40 minutes. Top should be lightly browned/golden. (Note: Don't have to pre-heat the oven. Just adjust the cooking time accordingly / check to see if need to leave in longer than 40 min.)" },
# oreo ice cream
  { recipe_id: 2, number: 1, directions: "Mix in a measuring cup." },
  { recipe_id: 2, number: 2, directions: "Chop." },
  { recipe_id: 2, number: 3, directions: "Combine with above and serve." },
# brownies
  { recipe_id: 3, number: 1, directions: "Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan." },
  { recipe_id: 3, number: 2, directions: "Melt." },
  { recipe_id: 3, number: 3, directions: "Stir in with above in glass popcorn bowl." },
  { recipe_id: 3, number: 4, directions: "Beat in with above." },
  { recipe_id: 3, number: 5, directions: "Spread batter into prepared pan." },
  { recipe_id: 3, number: 6, directions: "Bake in preheated oven for 25 to 30 minutes. Do not overcook. Done when fork comes out clean." },
  { recipe_id: 3, number: 7, directions: "Stir until smooth." },
  { recipe_id: 3, number: 8, directions: "Frost brownies while they are still warm!" },
  { recipe_id: 3, number: 9, directions: "After frosting brownies, put them back into the oven for 2 minutes to help melt/spread the frosting." }
]

steps.each do |step|
  Step.create(step)
end

measurements = [
  { recipe_id: 1, step_id: 1, ingredient_id: 4, amount: "1 1/2 C" },
  { recipe_id: 1, step_id: 1, ingredient_id: 3, amount: "1/2 C" },
  { recipe_id: 1, step_id: 1, ingredient_id: 2, amount: "1 Tbsp" },
  { recipe_id: 1, step_id: 2, ingredient_id: 5, amount: "1/2 C" },
  { recipe_id: 1, step_id: 3, ingredient_id: 1, amount: "3 - 5" },
  { recipe_id: 1, step_id: 4, ingredient_id: 2, amount: "1 Tbsp" },
  { recipe_id: 1, step_id: 4, ingredient_id: 3, amount: "1/2 C" },
#
  { recipe_id: 2, step_id: 7, ingredient_id: 6, amount: "3/4 C" },
  { recipe_id: 2, step_id: 7, ingredient_id: 3, amount: "1 Tbsp" },
  { recipe_id: 2, step_id: 7, ingredient_id: 8, amount: "Tiny splash" },
  { recipe_id: 2, step_id: 8, ingredient_id: 7, amount: "2" },
#
  { recipe_id: 3, step_id: 11, ingredient_id: 9, amount: "1/2 C" },
  { recipe_id: 3, step_id: 12, ingredient_id: 3, amount: "1/2 C" },
  { recipe_id: 3, step_id: 12, ingredient_id: 10, amount: "2" },
  { recipe_id: 3, step_id: 12, ingredient_id: 8, amount: "1 tsp" },
  { recipe_id: 3, step_id: 13, ingredient_id: 11, amount: "1/3 C" },
  { recipe_id: 3, step_id: 13, ingredient_id: 12, amount: "1/2 C" },
  { recipe_id: 3, step_id: 13, ingredient_id: 13, amount: "1/4 tsp" },
  { recipe_id: 3, step_id: 13, ingredient_id: 14, amount: "1/4 tsp" },
  { recipe_id: 3, step_id: 16, ingredient_id: 9, amount: "3 Tbsp" },
  { recipe_id: 3, step_id: 16, ingredient_id: 11, amount: "3 Tbsp" },
  { recipe_id: 3, step_id: 16, ingredient_id: 15, amount: "1 Tbsp" },
  { recipe_id: 3, step_id: 16, ingredient_id: 8, amount: "1 tsp" },
  { recipe_id: 3, step_id: 16, ingredient_id: 16, amount: "1 C" }
]

measurements.each do |measurement|
  Measurement.create(measurement)
end
