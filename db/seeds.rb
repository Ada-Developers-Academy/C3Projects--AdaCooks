require 'csv'

CSV.foreach("db/cookbooks.csv", headers: true) do |row|

  Cookbook.create(
    name: row[0],
    description: row[1],
    user_id: row[2]
  )
 end

 CSV.foreach("db/users.csv", headers: true) do |row|

   User.create(
     username: row[0],
     password: row[1],
     password_confirmation: row[2]
   )
  end

CSV.foreach("db/recipes.csv", headers: true) do |row|

  Recipe.create(
    name: row[0],
    description: row[1],
    image: row[2],
    preparation: row[3],
    user_id: row[4]
  )
 end

 CSV.foreach("db/ingredients.csv", headers: true) do |row|

   Ingredient.create(
     name: row[0],
     image: row[1]
   )
  end

cookbooks_recipes = { 1 => [5, 6, 8], 2 => [2, 7], 3 => [3, 6], 4 => [1, 2, 3, 4, 5, 7, 8], 5 => [1, 2, 4, 7]}

cookbooks_recipes.each do |k, v|
  cookbook = Cookbook.find(k)
  v.each do |r|
    cookbook.recipes << Recipe.find(r)
  end
end

recipes_ingredients = { 1 => [5, 6, 9, 10, 11, 12, 13, 14, 15, 16, 17], 2 => [5, 9, 14, 15, 18, 19], 3 => [5, 14, 18], 4 => [14, 15, 19, 20, 21, 22], 5 => [8, 16, 23], 6 => [1, 2, 8, 24], 7 => [3, 5, 6, 7, 11, 14, 15], 8 => [4, 5, 13, 14, 15, 19, 25]}

recipes_ingredients.each do |k, v|
  recipe = Recipe.find(k)
  v.each do |i|
    recipe.ingredients << Ingredient.find(i)
  end
end
