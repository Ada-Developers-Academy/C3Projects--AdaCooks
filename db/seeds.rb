# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ingredients = [
  { name: "Betty's Bacardi", user_id: 1, image:  File.open(File.join('app/assets/images/ingredients/betty.jpg')) }, #1
  { name: "Grace's Grenadine", user_id: 1, image: File.open(File.join('app/assets/images/ingredients/grace.jpg')) }, #2
  { name: "Serena's Simple Syrup", user_id: 1, image: File.open(File.join('app/assets/images/ingredients/serena.jpg')) }, #3
  { name: "Malala's Maraschino Cherries", user_id: 1, image: File.open(File.join('app/assets/images/ingredients/malala.jpg')) }, #4
  { name: "Oprah's Skinny Bitters", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/oprah.jpg')) }, #5
  { name: "Gloria's Gin", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/gloria.jpeg')) }, #6
  { name: "Ada's Aquavit", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/ada.jpg')) }, #7
  { name: "J.K.'s Jack Daniels", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/jk.jpg')) }, #8
  { name: "Zerlina's Lemon Zest ", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/zerlina.jpg')) }, #9
  { name: "Hillary's Hooch", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/hillary.jpg')) }, #10,
  { name: "Rosario's Rye Whisky", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/rosario.jpeg')) }, #11
  { name: "Maya's Midori", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/maya.jpg')) } #12
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

users = [
  { username: "Martha", email: "MStew@email.com", #1
    password: "password", password_confirmation: "password" },
  { username: "Alton", email: "ChemistryLuv@email.com", #2
    password: "password", password_confirmation: "password" },
  { username: "Emeril", email: "bam@email.com", #3
    password: "password", password_confirmation: "password" }
]

users.each do |user|
  User.create(user)
end

cookbooks = [
  { name: "How I Learned to Stop Caring and just Embrace the Booze", user_id: 1 },
  { name: "Entertaining Elixers", user_id: 1 },
  { name: "Chemical Dependency", user_id: 2 },
  { name: "And that Kids is Science", user_id: 2 },
  { name: "Bam Squared to the 10th Power", user_id: 3 },
]

cookbooks.each do |cookbook|
  Cookbook.create(cookbook)
end

recipes = [

]

recipes.each do |recipe|
  Recipe.create(recipe)
end
