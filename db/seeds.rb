require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CSV.foreach("db/user.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    User.create(row.to_hash)
end

CSV.foreach("db/ingredient.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    Ingredient.create(row.to_hash)
end

CSV.foreach("db/recipe.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    Recipe.create(row.to_hash)
end

CSV.foreach("db/cookbook2.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    Cookbook.create(row.to_hash)
end

dog_meat = Ingredient.create(name: "dog meat")
stew = Recipe.create(name: "dog meat stew", preparation: "1. Stew dog meat. 2. Choke.", user_id: 1, ingredient_ids: [1])
stew.ingredients << dog_meat

fanciful_feasts = Cookbook.find_by(name: "Fanciful Feasts")
fanciful_feasts.recipes << stew
