# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
         {id: 1, username: "Joe", password: "password", password_confirmation: "password", image: "farmer.jpg"},
         {id: 2, username: "Moe", password: "password", password_confirmation: "password", image: "moe.png"},
         {id: 3, username: "Flo", password: "password", password_confirmation: "password", image: "flo.jpg"}
       ]

users.each do |user|
  User.create(user)
end

ingredients = [
                {id:1, name: "banana", image: "banana.jpg", user_id: 1},
                {id:2, name: "apple", image: "apple.jpg", user_id: 2},
                {id:3, name: "mango", image: "mango.jpg", user_id: 3},
                {id:4, name: "ice", image: "ice.jpg", user_id: 1},
                {id:5, name: "peach", image: "peach.jpg", user_id: 2},
                {id:6, name: "peanut butter", image: "peanut_butter.jpg", user_id: 2},
                {id:7, name: "strawberry", image: "strawberry.jpg", user_id:1},
                {id:8, name: "kale", image:"kale.jpg", user_id: 3},
                {id:9, name: "flax", image: "flax.jpg", user_id: 2},
                {id:10, name: "orange juice", image: "orange_juice.jpg", user_id: 2}
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

recipes = [

{id:1, name: "Mango Banana Smoothie", description:"this delicious smoothie is perfect after a workout.",
 instructions:"blend mango, banana, and ice in a blender on high speed for 1 minute.",
 image: "yellow_smoothie.jpg", user_id:1 },

 {id:2, name: "Kale Apple Smoothie", description:"this delicious smoothie is perfect after a walk.",
 instructions:"blend apple, kale, and ice in a blender on high speed for 3 minutes.",
 image: "green_smoothie.jpg", user_id:2 } 

]

recipes.each do |recipe|
  Recipe.create(recipe)
end