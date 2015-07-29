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

ingredients_recipes = { 1 => [1, 2], 2 => [1, 3]}

ingredients_recipes.each do |i, r|
  ingredient = Ingredient.find(i)
  r.each do |x|
    ingredient.recipes << Recipe.find(x)
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
