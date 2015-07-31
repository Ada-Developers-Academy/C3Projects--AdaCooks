# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

cookbooks = [
  {
    name: "Dessert",
    description: "The best desserts from around our corner of the internet",
    user_id: 1
  },
  {
    name: "My Favorites",
    description: "These are some of my favorite things",
    user_id: 2
  }
]

cookbooks.each do |book|
  Cookbook.create book
end
# Users -------------------------------
users = [
  {username: "wangg", password_digest: 1234},
  {username: "brittz", password_digest: 1234}
  # when seeding users, store pw as 'password_digest'
]

users.each do |user|
  User.create user
end

# Recipes -------------------------------
recipes = [

  {
    name: "Chocolate Coconut Milk Ice Cream",
    description: "Healthy yet decadent",
    preparation: "Combine all of the ingredients in a blender, and blend until smooth and creamy. Adjust the flavor to your taste, then transfer to a freezer-safe container. Place in the freezer for 4-6 hours, or until firm.",
    user_id: 2,
    image: "choc_ice_cream.jpg"
  },

  {
    name: "Yam Chips",
    description: "Yam Chips",
    preparation: "Slice yam in thin slices using mandolin. Toss with rest of ingredients. Lay flat on foil and put it in the oven. Bake until crispy.",
    user_id: 1,
    image: "yam_chips.jpg"
  },

  {
    name: "Salsa Chicken",
    description: "Quick and easy mexican style crock pot recipe",
    preparation: "Add Chicken to crock pot, and all other ingredients on top.  Cook on low for 6 hours",
    user_id: 2,
    image: "black_pepper.jpg"
  },

  {
    name: "Witches Brew",
    description: "For a spooky halloween night",
    preparation: "Combine mud and water until desired consistency.  Add grass and earthworms as a garnish.",
    user_id: 1,
    image: "pineapple.jpg"
  },

  {
    name: "Soft Chocolate Chip Cookies",
    description: "Very delicious, you can use any flavor pudding you like for this recipe.",
    preparation: "Preheat oven to 350 degrees F (175 degrees C). Sift together the flour and baking soda, set aside. In a large bowl, cream together the butter, brown sugar, and white sugar. Beat in the instant pudding mix until blended. Stir in the eggs and vanilla. Blend in the flour Bake for 10 to 12 minutes in the preheated oven. Edges should be golden brown.mixture. Finally, stir in the chocolate chips and nuts. Drop cookies by rounded spoonfuls onto ungreased cookie sheets.",
    user_id: 2,
    image: "fake_reeses.jpg"
  },

  {
    name: "Peanut Butter & Jam Sando",
    description: "The golden oldie; never gets old",
    preparation: "Apply peanut butter to one piece of bread.  Add jam to the top to desired height. Enjoy.",
    user_id: 1,
    image: "yam.jpg"
  },

  {
    name: "Fried Chicken",
    description: "Finger licking-greasy good",
    preparation: "Heat oil in deep fryer, apply batter to chicken until coated.  Add to fryer until golden brown. Towel dry.",
    user_id: 2,
    image: "yam.jpg"
  }

]


recipes.each do |recipe|

  image_path = "app/assets/images/" + recipe[:image]

  Recipe.create(
  name: recipe[:name],
  description: recipe[:description],
  preparation: recipe[:preparation],
  user_id: recipe[:user_id],
  image: open(image_path)
  )

  x = Recipe.new recipe
  x.save(validate: false )

end

# Ingredients -------------------------------

ingredients = [

  {name: "Coconut Milk", image: "coconut_milk.jpg"},
  {name: "Cocoa Powder", image: "cocoa-powder.jpg"},
  {name: "Honey"},
  {name: "Almond Butter"},
  {name: "Yams", image: "yam.jpg"},
  {name: "Vanilla Extract"},
  {name: "Chicken"},
  {name: "Salsa"},
  {name: "Peanut Butter"},
  {name: "Bread"},
  {name: "Jam"},
  {name: "Mud"},
  {name: "Water"},
  {name: "Grass"},
  {name: "Chocolate Chip"},
  {name: "Flour"},
  {name: "Baking Powder"},
  {name: "Oil", image: "olive-oil.jpg"}

]
i = {}
ingredients.each do |ingredient|
  ar_obj = Ingredient.new ingredient
  ar_obj.save(validate: false)
  i[ar_obj.name] = ar_obj.id
  # key = "honey", value = honey id
end

# recipe-ingredient Join Table -------------------------------

recipe = Recipe.find(1)
# Chocolate Coconut Milk Ice Cream
recipe.ingredients << Ingredient.find(i["Honey"])
recipe.ingredients << Ingredient.find(i["Coconut Milk"])
recipe.ingredients << Ingredient.find(i["Cocoa Powder"])
recipe.ingredients << Ingredient.find(i["Almond Butter"])
recipe.ingredients << Ingredient.find(i["Vanilla Extract"])

recipe = Recipe.find(2)
# Yam Chips
recipe.ingredients << Ingredient.find(i["Yams"])

recipe = Recipe.find(3)
# Salsa Chicken
recipe.ingredients << Ingredient.find(i["Chicken"])
recipe.ingredients << Ingredient.find(i["Salsa"])

recipe = Recipe.find(4)
# Witches Brew
recipe.ingredients << Ingredient.find(i["Mud"])
recipe.ingredients << Ingredient.find(i["Water"])
recipe.ingredients << Ingredient.find(i["Grass"])

recipe = Recipe.find(5)
# Soft Chocolate Chip Cookies
recipe.ingredients << Ingredient.find(i["Chocolate Chip"])
recipe.ingredients << Ingredient.find(i["Flour"])
recipe.ingredients << Ingredient.find(i["Baking Powder"])
recipe.ingredients << Ingredient.find(i["Oil"])

recipe = Recipe.find(5)
# Peanut Butter & Jam Sando
recipe.ingredients << Ingredient.find(i["Peanut Butter"])
recipe.ingredients << Ingredient.find(i["Jam"])
recipe.ingredients << Ingredient.find(i["Bread"])


recipe = Recipe.find(5)
# Fried Chicken
recipe.ingredients << Ingredient.find(i["Chicken"])
recipe.ingredients << Ingredient.find(i["Oil"])

# cookbook-recipe Join Table -------------------------------

book = Cookbook.find(1)
# Dessert
book.recipes << Recipe.find(1)
book.recipes << Recipe.find(2)
book.recipes << Recipe.find(5)
book.recipes << Recipe.find(6)

book = Cookbook.find(2)
# My Favorites
book.recipes << Recipe.find(3)
book.recipes << Recipe.find(4)
