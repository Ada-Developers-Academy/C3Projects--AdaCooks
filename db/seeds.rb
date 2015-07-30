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
    image: open(image_path)
  )
end

CSV.foreach("db/recipes.csv", headers: true) do |row|
  image_path = "app/assets/images/" + row[2]

  Recipe.create(
    name: row[0],
    desc: row[1],
    image: open(image_path),
    prep: row[3],
    cookbook_id: row[4],
    user_id: row[5]
  )
end

ingredients_recipes = { 1 => [1, 2, 7], 2 => [8, 3, 9], 3 => [4, 3, 6, 7], 4 => [4, 3, 6], 5 => [2, 3], 6 => [3, 4, 5], 7 => [1, 3, 5, 7], 8 => [2, 4, 6, 8, 10], 9 => [1, 2, 3, 4, 5], 10 => [6, 7, 8, 9, 10], 11 => [5, 10], 12 => [3, 4, 5, 6, 7], 13 => [9, 10, 3], 14 => [1, 7, 9], 15 => [4, 9], 16 => [3, 10], 17 => [2, 1, 9], 18 => [4, 5, 8], 19 => [5, 6], 20 => [1, 10, 7], 21 => [5, 8, 7] }

ingredients_recipes.each do |i, r|
  ingredient = Ingredient.find(i)
  r.each do |x|
    ingredient.recipes << Recipe.find(x)
  end
end
