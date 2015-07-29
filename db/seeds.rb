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
  { name: "Apples" },
  { name: "Cinnamon" },
  { name: "Sugar" },
  { name: "Rolled Oats" },
  { name: "Olive Oil" }
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

steps = [
  { recipe_id: 1, number: 1, directions: "Mix together, preferably with a fork." },
  { recipe_id: 1, number: 2, directions: "Mix with above." },
  { recipe_id: 1, number: 3, directions: "Chop, putting into the 9x9 glass pan as you work. (Stop whenever the height looks good… don’t want it too close to the top or it’ll bubble over, but note that the topping won’t add much height (if any).)" },
  { recipe_id: 1, number: 2, directions: "Add to the apples and mix well." },
  { recipe_id: 1, number: 2, directions: "Add the crumbs/topping on the top. Pack down so it’s smooth all the way across." },
  { recipe_id: 1, number: 2, directions: "Bake in oven at 350 for ~40 minutes. Top should be lightly browned/golden. (Note: Don't have to pre-heat the oven. Just adjust the cooking time accordingly / check to see if need to leave in longer than 40 min.)" },
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
  { recipe_id: 1, step_id: 4, ingredient_id: 3, amount: "1/2 C" }
]

measurements.each do |measurement|
  Measurement.create(measurement)
end
