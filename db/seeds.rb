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

# u = User.create(:first_name => "admin", :email => "admin@domain.com", :password => "admin")
# u.roles << Role.find_by_name("super_admin")

king_jies_lake_of_wine = Recipe.find(4)
wine = Ingredient.create(name: "wine", user_id: 2)
king_jies_lake_of_wine.ingredients << wine
