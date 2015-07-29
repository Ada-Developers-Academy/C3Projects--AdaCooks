require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach("db/users.csv", headers: true) do |row|

  User.create(
  name: row[0],
  email: row[1],
  password: row[2],
  password_confirmation: row[3]
  )
end

CSV.foreach("db/ingredients.csv", headers: true) do |row|

  Ingredient.create(
  name: row[0],
  image_url: row[1]
  )
end

CSV.foreach("db/recipes.csv", headers: true) do |row|

  Recipe.create(
  name: row[0],
  description: row[1],
  image_url: row[2],
  preparation: row[3],
  cookbook_id: row[4]
  )
end

CSV.foreach("db/cookbooks.csv", headers: true) do |row|

  Cookbook.create(
  name: row[0],
  description: row[1],
  image_url: row[2],
  user_id: row[3]
  )
end
 # 1 - 4 recipes.
ingredients_recipes = {1 => [21, 46, 18, 12, 20, 22, 11, 19], 2 => [23, 6, 12, 11, 24, 8, 13, 26, 25], 3 => [16, 47, 27, 28, 3, 17, 29, 48, 30, 31, 32, 33, 6, 34, 35, 41, 36, 37, 38], 4 => [39, 40, 37, 41, 42, 2, 28, 49, 50, 44, 45] }

ingredients_recipes.each do |k, v|
  recipe = Recipe.find(k)
  v.each do |ingredient|
    recipe.ingredients << Ingredient.find(ingredient)
  end
end
