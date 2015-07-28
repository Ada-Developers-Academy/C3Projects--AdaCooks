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
  user_id: row[2]
  )
end

ingredients_recipes = {}
