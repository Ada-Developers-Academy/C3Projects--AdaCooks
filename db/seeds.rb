# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [
  { username: "sherbet", password: "dairy", password_confirmation: "dairy" },
  { username: "sorbet", password: "sugar", password_confirmation: "sugar" },
  { username: "werehawke", password: "666", password_confirmation: "666" }
]

users.each do |user_params|
  User.create(user_params)
end

recipes = [
  { name: "Mint chocolate chip ice cream", description: "creamy, minty goodness", 
    image: "", user_id: 1 },
  { name: "French vanilla ice cream", description: "rich custard with flecks of real vanilla bean",
    image: "", user_id: 1 },
  { name: "Cappuccino gelato", description: "smooth, with flecks of coffee", 
    image: "", user_id: 1 },
  { name: "Chocolate hazelnut gelato", description: "the perfect flavor pairing for autumn", 
    image: "", user_id: 1 },
  { name: "Raspberry sorbet", description: "crisp and vibrant with a hint of sweetness", 
    image: "", user_id: 2 },
  { name: "Honey lavendar ice cream", description: "light herbal notes with wildflower sweetness", 
    image: "", user_id: 2 },
  { name: "Nisqually flood ice cream", description: "gummy worms and chocolate twigs float in this homage to the power of nature", 
    image: "", user_id: 2 },
  { name: "Candied ginger ice cream", description: "a custard base topped with chunks of tangy candied ginger", 
    image: "", user_id: 2 },
  { name: "Lemon sorbet", description: "light, crisp, and refreshing citrus", 
    image: "", user_id: 3 },
  { name: "Raspberry chevre ice cream", description: "goat's milk ice cream with chunks of mild chevre and a raspberry ribbon", 
    image: "", user_id: 3 }
  { name: "Wild blackberry ice cream", description: "fresh fruit bursting with flavor in a sweet cream base", 
    image: "", user_id: 3 },
  { name: "Maple walnut ice cream", description: "earthy and rich with sweet tree sap", 
    image: "", user_id: 3 }
]

recipes.each do |recipe_params|
  new_recipe = Recipe.new(recipe_params)
  new_recipe.preparation = "1. Heat cream, add to yolks to temper. 2. Freeze in ice cream maker. 3. Enjoy!"
  new_recipe.save
end

cookbooks = [
  { name: "Ice Creams I Have Loved", description: "a walk down memory lane", user_id: 1 },
  { name: "Sorbet 4 Daze", description: "non-dairy treats for the lactose intolerant", user_id: 1 },
  { name: "Gelato to Da Max", description: "Hawaiian-Italian fusion desserts", user_id: 2 },
  { name: "Frozen Desserts", description: "ice cream, gelato, sorbet, sherbet, kulfi, etc.", user_id: 2 },
  { name: "I Scream, You Scream", description: "we all scream, of ice cream", user_id: 3 },
  { name: "The Dao of Ice Cream", description: "reaching enlightenment via massive consumption of ice cream", user_id: 3 }
]

cookbooks.each do |cookbook_params|
  Cookbook.create(cookbook_params)
end
