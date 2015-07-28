# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cookbooks = [
  { name: 'Chicago-Style Eats',
    description: 'Tasty Chicago foods. Period.',
    user_id: 1 },
  { name: 'Eat This Food',
    description: "These foods are super tasty, so eat them.",
    user_id: 1 },
  { name: 'Tasty Bits with Pusheen',
    description: "Pusheen <3 eatings.",
    user_id: 2 }
]

cookbooks.each do |cookbook|
  Cookbook.create(cookbook)
end

ingredients = [
  { name: 'Pork Shoulder',
    user_id: 2 },
  { name: 'Popcorn',
    user_id: 1 },
  { name: 'Chocolate Chips',
    user_id: 2 }
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

recipes = [
  { name: 'Chocolate Chip Cookies',
    description: 'Everyone loves chocolate chip cookies',
    preparation: 'Mix chocolate chips with some other stuff',
    user_id: 1 },
  { name: 'Awesome Pizza',
    description: "Really awesome pizza",
    preparation: 'Dough. Cheese. Sauce. Pepperoni. DONE.',
    user_id: 2 },
  { name: 'Baked Alaska',
    description: "FIRE",
    preparation: 'Mix stuff together. Add brandy. Set on fire.',
    user_id: 2 },
]

recipes.each do |recipe|
  Recipe.create(recipe)
end

users = [
  { username: 'sam',
    email: 'sam@sam.sam',
    password: 'samsamsam',
    password_confirmation: 'samsamsam'},
  { username: 'pusheen',
    email: "kitty@meow.com",
    password: 'kittycat',
    password_confirmation: 'kittycat'},
]

users.each do |user|
  User.create(user)
end

Recipe.all.each do |recipe|
  recipe.ingredients << Ingredient.all.sample(0..3)
end

Cookbook.all.each do |cookbook|
  cookbook.recipes << Recipe.all.sample(0..3)
end
