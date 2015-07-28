require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach("db/seed_data/users.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
  User.create(
    username:              row[:username],
    email:                 row[:email],
    password:              row[:password],
    password_confirmation: row[:password_confirmation]
  )
end

CSV.foreach("db/seed_data/cookbooks.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
  Cookbook.create(
    name: row[:name],
    description: row[:description],
    user_id: row[:user_id]
  )
end

CSV.foreach("db/seed_data/recipes.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
  recipe = Recipe.create(
            name: row[:name],
            steps: row[:steps],
            description: row[:description],
            user_id: row[:user_id]
          )

  cookbooks = row[:cookbooks]

  if cookbooks
    if cookbooks.class == String
      cookbooks = cookbooks.split(", ")

      cookbooks.each do |cookbook_id|
        book = Cookbook.find(cookbook_id)
        book.recipes << recipe
      end
    else # otherwise will be an integer
      book = Cookbook.find(cookbooks)
      book.recipes << recipe
    end
  end
end

CSV.foreach("db/seed_data/ingredients.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all }) do |row|
  ingredient = Ingredient.create(
                name: row[:name],
                user_id: row[:user_id]
              )

  recipes = row[:recipes]

  if recipes
    if recipes.class == String
      recipes = recipes.split(", ")

      recipes.each do |recipe_id|
        recipe = Recipe.find(recipe_id)
        recipe.ingredients << ingredient
      end
    else # otherwise will be an integer
      recipe = Recipe.find(recipes)
      recipe.ingredients << ingredient
    end
  end
end
