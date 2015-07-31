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
  { name: "Zerlina's Orange Zest ", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/zerlina.jpg')) }, #9
  { name: "Hillary's Hooch", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/hillary.jpg')) }, #10,
  { name: "Rosario's Rye Whisky", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/rosario.jpeg')) }, #11
  { name: "Maya's Midori", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/maya.jpg')) }, #12
  { name: "Orange Juice", user_id: 1, image:File.open(File.join('app/assets/images/ingredients/orange.jpeg')) }, #13
  { name: "7-Up", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/7up.jpeg'))}, #14
  { name: "Whisky Sour Mix", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/sour.jpeg')) }, #15
  { name: "Tina's Tequila", user_id: 1, image: File.open(File.join('app/assets/images/ingredients/tina.jpg')) }, #16
  { name: "Leslie's Liquer", user_id: 3, image: File.open(File.join('app/assets/images/ingredients/Leslie.jpeg')) }, #17
  { name: "Veronica's Vodka", user_id: 2, image: File.open(File.join('app/assets/images/ingredients/veronica.jpg')) } #18
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
  {name: "Ally's Toast", user_id: 1, cookbook_id: 1, description: "This sweet concoction is the perfect treat after a long week.", prep: "Mix the grenadine and gin together and then pour over a glass of ice. For added pizazz add your favorite garnish or use rimming sugar", image: File.open(File.join('app/assets/images/recipes/sugar.jpeg')) }, #1
  {name: "Equally Delicious", user_id: 1, cookbook_id: 2, description: "A surprisingly strong orange drink", prep: "In a large glass combine the hooch, whisky and orange juice. Stir until combined. Add ice if desired. Garnish with orange zest.", image: File.open(File.join('app/assets/images/recipes/hooch.jpg')) }, #2
  {name: "Empowered Epiphany", user_id: 2, cookbook_id: 3, description: "Whisky on the rocks levels up with bitters and simple syrup.", prep: "Stir whisky and simple sryup together until combined. Add bitters and pour over ice.", image: File.open(File.join('app/assets/images/recipes/whisky.jpeg')) }, #3
  {name: "Rolling over Gender Roles", user_id: 2, cookbook_id: 4, description: "A sweet and tart beverage great for a night out or a night in.", prep: "Mix together 7-up, whisky sour and Midori. Add 1-3 maraschino cherries.", image: File.open(File.join('app/assets/images/recipes/midori.jpg')) }, #4
  {name: "Decisive", user_id: 1, cookbook_id: 1, description: "A sweet and tart beverage great for a night out or a night in.", prep: "Pour whisky over ice. The End.", image: File.open(File.join('app/assets/images/recipes/basic.jpeg')) }, #5
  {name: "Right to Choose... to Party", user_id: 1, cookbook_id: 2, description: "A delicious mix, both sweet and subtle.", prep: "Mix all ingredients, garnish with cherries.", image: File.open(File.join('app/assets/images/recipes/fruitopia.jpeg')) }, #6
  {name: "Rebelious Rum Punch", user_id: 2, cookbook_id: 3, description: "Refreshing citrus rum punch.", prep: "Mix all ingredients until combined, serve over ice.", image: File.open(File.join('app/assets/images/recipes/sunset.jpeg')) }, #7
  {name: "Girls Just Want to Have FUNdimental Rights", user_id: 2, cookbook_id: 4, description: "A strong mix for a strong woman.", prep: "Mix everything together, look at you getting stuff done!", image: File.open(File.join('app/assets/images/recipes/green.jpeg')) }, #8
  {name: "Because I am a Boss aka Bossy", user_id: 1, cookbook_id: 1, description: "A classic stiff drink", prep: "Mix together all ingredients and serve over ice.", image: File.open(File.join('app/assets/images/recipes/stiff.jpeg')) }, #9
  {name: "Smash(ed) the Patriarchy", user_id: 1, cookbook_id: 2, description: "Get the party started with this intoxicating mix.", prep: "in a bathtub mix together all ingredients.", image: File.open(File.join('app/assets/images/recipes/bathtub.png')) } #10
]

recipes.each do |recipe|
  Recipe.create(recipe)
end

recipe_ingredients = [
  { recipe_id: 1, ingredient_id: 6, quantity: 2, measurement: "ounces" },
  { recipe_id: 1, ingredient_id: 2, quantity: 2, measurement: "ounces" },
  { recipe_id: 2, ingredient_id: 10, quantity: 2, measurement: "ounces" },
  { recipe_id: 2, ingredient_id: 13, quantity: 4, measurement: "ounces" },
  { recipe_id: 2, ingredient_id: 9, quantity: 1, measurement: "pinch" },
  { recipe_id: 3, ingredient_id: 8, quantity: 2, measurement: "ounces" },
  { recipe_id: 3, ingredient_id: 3, quantity: 2, measurement: "ounces" },
  { recipe_id: 3, ingredient_id: 5, quantity: 1, measurement: "ounces" },
  { recipe_id: 4, ingredient_id: 14, quantity: 4, measurement: "ounces" },
  { recipe_id: 4, ingredient_id: 15, quantity: 2, measurement: "ounces" },
  { recipe_id: 4, ingredient_id: 12, quantity: 2, measurement: "ounces" },
  { recipe_id: 4, ingredient_id: 4, quantity: 2 },
  { recipe_id: 5, ingredient_id: 11, quantity: 4, measurement:"ounces" },
  { recipe_id: 6, ingredient_id: 16, quantity: 2, measurement: "ounces" },
  { recipe_id: 6, ingredient_id: 12, quantity: 3 },
  { recipe_id: 6, ingredient_id: 1, quantity: 2, measurement: "ounces" },
  { recipe_id: 6, ingredient_id: 14, quantity: 4, measurement: "ounces" },
  { recipe_id: 7, ingredient_id: 1, quantity: 2, measurement: "ounces" },
  { recipe_id: 7, ingredient_id: 13, quantity: 2, measurement: "ounces" },
  { recipe_id: 7, ingredient_id: 14, quantity: 2, measurement: "ounces" },
  { recipe_id: 8, ingredient_id: 17, quantity: 2, measurement: "ounces" },
  { recipe_id: 8, ingredient_id: 6, quantity: 2, measurement: "ounces" },
  { recipe_id: 8, ingredient_id: 7, quantity: 1, measurement: "ounces" },
  { recipe_id: 8, ingredient_id: 12, quantity: 2, measurement: "ounces" },
  { recipe_id: 8, ingredient_id: 14, quantity: 4, measurement: "ounces" },
  { recipe_id: 9, ingredient_id: 8, quantity: 2, measurement: "ounces" },
  { recipe_id: 9, ingredient_id: 11, quantity: 2, measurement: "ounces" },
  { recipe_id: 9, ingredient_id: 5, quantity: 1, measurement: "ounces" },
  { recipe_id: 10, ingredient_id: 1, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 2, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 3, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 4, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 6, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 8, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 10, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 16, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 17, quantity: 750, measurement: "ml" },
  { recipe_id: 10, ingredient_id: 14, quantity: 750, measurement: "ml" },

]

recipe_ingredients.each do |recipe_ingredients|
  RecipeIngredient.create(recipe_ingredients)
end
