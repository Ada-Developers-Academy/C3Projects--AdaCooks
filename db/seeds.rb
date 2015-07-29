require 'CSV'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach("db/seed_data_cookbooks.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    image_path = "app/assets/images/" + row[:image]

    Cookbook.create(
      name: row[:name],
      description: row[:description],
      user_id: row[:user_id],
      image: open(image_path)
      )
end

CSV.foreach("db/seed_data_recipes.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    image_path = "app/assets/images/" + row[:image]

    r = Recipe.create(
      name: row[:name],
      description: row[:description],
      image: open(image_path),
      preparation: row[:preparation]
      )

    r.cookbooks << Cookbook.find_by_name(row[:cookbook_name])
end

CSV.foreach("db/seed_data_ingredients.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    image_path = "app/assets/images/" + row[:image]

    i = Ingredient.create(
      name: row[:name],
      image: open(image_path)
      )

    i.recipes << Recipe.find_by_name(row[:recipe_name])

end


CSV.foreach("db/seed_data_users.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    image_path = "app/assets/images/" + row[:image]

    User.create(
      username: row[:username],
      password: row[:password],
      password_confirmation: row[:password_confirmation],
      image: open(image_path)
      )
end

