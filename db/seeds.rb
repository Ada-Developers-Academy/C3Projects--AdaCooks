# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
         {id: 1, username: "Joe", password: "password", password_confirmation: "password", image: File.open(File.join('app/assets/images/farmer.jpg'))},
         {id: 2, username: "Moe", password: "password", password_confirmation: "password", image: File.open(File.join('app/assets/images/moe.png'))},
         {id: 3, username: "Flo", password: "password", password_confirmation: "password", image: File.open(File.join('app/assets/images/flo.jpg'))}
       ]

users.each do |user|
  User.create(user)
end

ingredients = [image:   }
                {id:1, name: "banana", image: File.open(File.join('app/assets/images/banana.jpg')), user_id: 1},
                {id:2, name: "apple", image: File.open(File.join('app/assets/images/apple.jpg')), user_id: 2},
                {id:3, name: "mango", image: File.open(File.join('app/assets/images/mango.jpg')), user_id: 3},
                {id:4, name: "ice", image: File.open(File.join('app/assets/images/ice.jpg')), user_id: 1},
                {id:5, name: "peach", image: File.open(File.join('app/assets/images/peach.jpg')), user_id: 2},
                {id:6, name: "peanut butter", image: File.open(File.join('app/assets/images/peanut_butter.jpg')), user_id: 2},
                {id:7, name: "strawberry", image: File.open(File.join('app/assets/images/strawberry.jpg')), user_id:1},
                {id:8, name: "kale", image:File.open(File.join('app/assets/images/kale.jpg')), user_id: 3},
                {id:9, name: "flax", image: File.open(File.join('app/assets/images/flax.jpg')), user_id: 2},
                {id:10, name: "orange juice", image: File.open(File.join('app/assets/images/orange_juice.jpg')), user_id: 2}
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end

recipes = [

{id:1, name: "Mango Banana Smoothie", description:"this delicious smoothie is perfect after a workout.",
 instructions:"blend mango, banana, and ice in a blender on high speed for 1 minute.",
 image: File.open(File.join('app/assets/images/yellow_smoothie2.jpg')), user_id:1 },

 {id:2, name: "Kale Apple Smoothie", description:"this delicious smoothie is perfect after a walk.",
 instructions:"blend apple, kale, and ice in a blender on high speed for 3 minutes.",
 image: File.open(File.join('app/assets/images/green_smoothie.jpg')), user_id:2 }, 

 {id:3, name: "Strawberry Apple Smoothie", description:"this delicious smoothie is perfect after a walk.",
 instructions:"blend apple, strawberry, and ice in a blender on high speed for 3 minutes.",
 image: File.open(File.join('app/assets/images/strawberry_smoothie.jpg')), user_id:1},

 {id:4, name: "Flax seed Spinach Smoothie", description:"this delicious smoothie is perfect after a walk.",
 instructions:"blend flax seed, spinach, and ice in a blender on high speed for 3 minutes.",
 image: File.open(File.join('app/assets/images/another_smoothie.jpg')), user_id:2}

]

recipes.each do |recipe|
  Recipe.create(recipe)
end

recipe1, recipe2, recipe3, recipe4 = Recipe.all

recipe1.ingredients << Ingredient.find([1, 3, 4])
recipe2.ingredients << Ingredient.find([2, 4, 8])
recipe3.ingredients << Ingredient.find([2, 4, 7])
recipe4.ingredients << Ingredient.find([9, 4])

cookbooks = [
           {id: 1, name: "Green Smoothies", user_id: 3},
           {id: 2, name: "Fruity Smoothies", user_id: 2}
]

cookbooks.each do |cookbook|
  Cookbook.create(cookbook)
end



cookbook1, cookbook2 = Cookbook.all

cookbook1.recipes << Recipe.find([2, 4])
cookbook2.recipes << Recipe.find([1, 3])
