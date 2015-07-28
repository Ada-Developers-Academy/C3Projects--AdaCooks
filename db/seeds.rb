require 'CSV'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CSV.foreach("db/seed_data_ingredients.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    image_path = "app/assets/images/" + row[:image]

    Ingredient.create(
      name: row[:name],
      image: open(image_path)
      )
end