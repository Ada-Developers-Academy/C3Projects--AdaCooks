require 'csv'

CSV.foreach("db/users.csv", headers: true) do |row|
  User.create(
    name: row[0],
    email: row[1],
    password: row[2],
    password_confirmation: row[3]
    )
end

CSV.foreach("db/cookbooks.csv", headers: true) do |row|
  Cookbook.create(
    name: row[0],
    desc: row[1],
    user_id: row[2]
  )
end

CSV.foreach("db/ingredients.csv", headers: true) do |row|
  image_path = "app/assets/images/" + row[1]

  Ingredient.create(
    name: row[0],
    image: open(image_path),
    user_id: row[2]
  )
end

CSV.foreach("db/recipes.csv", headers: true) do |row|
  image_path = "app/assets/images/" + row[2]

  x = Recipe.new(
    name: row[0],
    desc: row[1],
    image: open(image_path),
    prep: row[3],
    user_id: row[4]
  )
  x.save(validate: false)
end

ingredients_recipes = { 1 => [1, 2, 7, 11, 15, 14], 2 => [8, 3, 9, 11], 3 => [4, 3, 6, 7, 15, 12], 4 => [4, 3, 6, 15, 13], 5 => [2, 3, 11], 6 => [3, 4, 5, 16, 13], 7 => [1, 3, 5, 7], 8 => [2, 4, 6, 8, 10, 11], 9 => [1, 2, 3, 4, 5, 12, 13, 15], 10 => [6, 7, 8, 9, 10], 11 => [5, 10], 12 => [3, 4, 5, 6, 7, 12], 13 => [9, 10, 3, 14], 14 => [1, 7, 9], 15 => [4, 9, 15, 16], 16 => [3, 10, 12], 17 => [2, 1, 9, 15], 18 => [4, 5, 8, 12, 13, 16], 19 => [5, 6, 12], 20 => [1, 10, 7, 11, 12], 21 => [5, 8, 7, 15, 13] }

ingredients_recipes.each do |i, r|
  ingredient = Ingredient.find(i)
  r.each do |x|
    ingredient.recipes << Recipe.find(x)
  end
end

cookbooks_recipes = { 1 => [1, 2, 13, 15, 8], 2 => [4, 6, 12, 14], 3 => [1, 2, 3, 4, 8, 9, 10, 12, 14, 15, 16], 4 => [2, 4, 7, 10], 5 => [2, 3, 8, 11, 13], 6 => [3, 4, 5, 8, 11, 14] }

cookbooks_recipes.each do |i, r|
  cookbook = Cookbook.find(i)
  r.each do |x|
    cookbook.recipes << Recipe.find(x)
  end
end
