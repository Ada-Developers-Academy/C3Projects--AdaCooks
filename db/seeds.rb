# users ------------------------------------------------------------------------
users_params = {
  gurl: { username: "gurl", email: "gurl@example.com", password: "gurl", password_confirmation: "gurl", bio: "Just a midwest gurl." },
  cheese_man: { username: "I LIKE CHEESE", email: "cheese@rulez.com", password: "potato", password_confirmation: "potato", bio: "I LIKE CHEESE, COULD YOU TELL!?!" },
  apple_girl: { username: "AppleGirl", email: "apple@girl.com", password: "apple", password_confirmation: "apple" }
}

users = {}
users_params.each do |var_name, params|
  users[var_name] = User.create(params)
end

# recipes ----------------------------------------------------------------------
recipes_params = {
  apple_crisp: { name: "Apple Crisp", description: "Yummy, cinnamony goodness!", user_id: users[:gurl].id, image: "apple_crisp.jpg" },
  oreo_ice_cream: { name: "Oreo Ice Cream", description: "Delicious on a hot day!", user_id: users[:gurl].id, image: "oreo_ice_cream.jpg" },
  brownies: { name: "Brownies", description: "Delicious on a cold day!", user_id: users[:gurl].id, image: "brownies.jpg" },
  mac_and_cheese: { name: "Mac & Cheese", description: "SO YUMMY!!", user_id: users[:cheese_man].id, image: "mac-cheese.jpg" },
  water_recipe: { name: "Water", description: "Drink me.", user_id: users[:cheese_man].id }
}

recipes = {}
recipes_params.each do |var_name, params|
  recipes[var_name] = Recipe.create(params)
  if params[:image]
    recipes[var_name].image = Rails.root.join("db/seeds/images/#{params[:image]}").open
    recipes[var_name].save!
  end
end

# ingredients ------------------------------------------------------------------
ingredients_params = {
  apples: { name: "Apples", user_id: users[:gurl].id },
  cinnamon: { name: "Cinnamon", user_id: users[:gurl].id },
  white_sugar: { name: "White Sugar", user_id: users[:gurl].id },
  rolled_oats: { name: "Rolled Oats", user_id: users[:gurl].id },
  olive_oil: { name: "Olive Oil", user_id: users[:gurl].id },
  milk: { name: "Milk", user_id: users[:gurl].id },
  oreos: { name: "Oreos", user_id: users[:gurl].id },
  vanilla: { name: "Vanilla Extract", user_id: users[:gurl].id },
  butter: { name: "Butter", user_id: users[:gurl].id },
  eggs: { name: "Eggs", user_id: users[:gurl].id },
  cocoa_powder: { name: "Unsweetend Cocoa Powder", user_id: users[:gurl].id },
  whole_wheat_flour: { name: "Whole Wheat Flour", user_id: users[:gurl].id },
  salt: { name: "Salt", user_id: users[:gurl].id },
  baking_powder: { name: "Baking Powder", user_id: users[:gurl].id },
  honey: { name: "Honey", user_id: users[:gurl].id },
  powdered_sugar: { name: "Powdered Sugar", user_id: users[:gurl].id },
  cheese: { name: "Cheese", user_id: users[:cheese_man].id },
  water: { name: "Water", user_id: users[:apple_girl].id, image: "water.jpg" }
}

ingredients = {}
ingredients_params.each do |var_name, params|
  ingredients[var_name] = Ingredient.create(params)
  if params[:image]
    ingredients[var_name].image = Rails.root.join("db/seeds/images/#{params[:image]}").open
    ingredients[var_name].save!
  end
end

# steps ------------------------------------------------------------------------
apple_crisp_step1 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 1, directions: "Mix together, preferably with a fork." } )
apple_crisp_step2 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 2, directions: "Mix with above." } )
apple_crisp_step3 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 3, directions: "Chop, putting into the 9x9 glass pan as you work. (Stop whenever the height looks good… don’t want it too close to the top or it’ll bubble over, but note that the topping won’t add much height (if any).)" } )
apple_crisp_step4 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 4, directions: "Add to the apples and mix well." } )
apple_crisp_step5 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 5, directions: "Add the crumbs/topping on the top. Pack down so it’s smooth all the way across." } )
apple_crisp_step6 = Step.create( { recipe_id: recipes[:apple_crisp].id, number: 6, directions: "Bake in oven at 350 for ~40 minutes. Top should be lightly browned/golden. (Note: Don't have to pre-heat the oven. Just adjust the cooking time accordingly / check to see if need to leave in longer than 40 min.)" } )

oreo_ice_cream_step1 = Step.create( { recipe_id: recipes[:oreo_ice_cream].id, number: 1, directions: "Mix in a measuring cup." } )
oreo_ice_cream_step2 = Step.create( { recipe_id: recipes[:oreo_ice_cream].id, number: 2, directions: "Chop." } )
oreo_ice_cream_step3 = Step.create( { recipe_id: recipes[:oreo_ice_cream].id, number: 3, directions: "Combine with above and serve." } )

brownies_step1 = Step.create( { recipe_id: recipes[:brownies].id, number: 1, directions: "Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan." } )
brownies_step2 = Step.create( { recipe_id: recipes[:brownies].id, number: 2, directions: "Melt." } )
brownies_step3 = Step.create( { recipe_id: recipes[:brownies].id, number: 3, directions: "Stir in with above in glass popcorn bowl." } )
brownies_step4 = Step.create( { recipe_id: recipes[:brownies].id, number: 4, directions: "Beat in with above." } )
brownies_step5 = Step.create( { recipe_id: recipes[:brownies].id, number: 5, directions: "Spread batter into prepared pan." } )
brownies_step6 = Step.create( { recipe_id: recipes[:brownies].id, number: 6, directions: "Bake in preheated oven for 25 to 30 minutes. Do not overcook. Done when fork comes out clean." } )
brownies_step7 = Step.create( { recipe_id: recipes[:brownies].id, number: 7, directions: "Stir until smooth." } )
brownies_step8 = Step.create( { recipe_id: recipes[:brownies].id, number: 8, directions: "Frost brownies while they are still warm!" } )
brownies_step9 = Step.create( { recipe_id: recipes[:brownies].id, number: 9, directions: "After frosting brownies, put them back into the oven for 2 minutes to help melt/spread the frosting." } )

mac_cheese_step1 = Step.create( { recipe_id: recipes[:mac_and_cheese].id, number: 1, directions: "Add cheese." } )
mac_cheese_step2 = Step.create( { recipe_id: recipes[:mac_and_cheese].id, number: 2, directions: "Add more cheese." } )
mac_cheese_step3 = Step.create( { recipe_id: recipes[:mac_and_cheese].id, number: 3, directions: "Be sure to add more cheese." } )

water_step1 = Step.create( { recipe_id: recipes[:water_recipe].id, number: 1, directions: "Drink." } )

# measurements -----------------------------------------------------------------
measurements = [
  # apple crisp
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step1.id, ingredient_id: ingredients[:rolled_oats].id, amount: "1 1/2 C" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step1.id, ingredient_id: ingredients[:white_sugar].id, amount: "1/2 C" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step1.id, ingredient_id: ingredients[:cinnamon].id, amount: "1 Tbsp" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step2.id, ingredient_id: ingredients[:olive_oil].id, amount: "1/2 C" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step3.id, ingredient_id: ingredients[:apples].id, amount: "3 - 5" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step4.id, ingredient_id: ingredients[:cinnamon].id, amount: "1 Tbsp" },
  { recipe_id: recipes[:apple_crisp].id, step_id: apple_crisp_step4.id, ingredient_id: ingredients[:white_sugar].id, amount: "1/2 C" },

  # oreo ice cream
  { recipe_id: recipes[:oreo_ice_cream].id, step_id: oreo_ice_cream_step1.id, ingredient_id: ingredients[:milk].id, amount: "3/4 C" },
  { recipe_id: recipes[:oreo_ice_cream].id, step_id: oreo_ice_cream_step1.id, ingredient_id: ingredients[:white_sugar].id, amount: "1 Tbsp" },
  { recipe_id: recipes[:oreo_ice_cream].id, step_id: oreo_ice_cream_step1.id, ingredient_id: ingredients[:vanilla].id, amount: "Tiny splash" },
  { recipe_id: recipes[:oreo_ice_cream].id, step_id: oreo_ice_cream_step2.id, ingredient_id: ingredients[:oreos].id, amount: "2" },

  # brownies
  { recipe_id: recipes[:brownies].id, step_id: brownies_step2.id, ingredient_id: ingredients[:butter].id, amount: "1/2 C" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step3.id, ingredient_id: ingredients[:white_sugar].id, amount: "1/2 C" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step3.id, ingredient_id: ingredients[:eggs].id, amount: "2" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step3.id, ingredient_id: ingredients[:vanilla].id, amount: "1 tsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step4.id, ingredient_id: ingredients[:cocoa_powder].id, amount: "1/3 C" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step4.id, ingredient_id: ingredients[:whole_wheat_flour].id, amount: "1/2 C" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step4.id, ingredient_id: ingredients[:salt].id, amount: "1/4 tsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step4.id, ingredient_id: ingredients[:baking_powder].id, amount: "1/4 tsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:butter].id, amount: "3 Tbsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:cocoa_powder].id, amount: "3 Tbsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:honey].id, amount: "1 Tbsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:vanilla].id, amount: "1 tsp" },
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:powdered_sugar].id, amount: "1 C" },

  # cheese
  { recipe_id: recipes[:mac_and_cheese].id, step_id: mac_cheese_step1.id, ingredient_id: ingredients[:cheese].id, amount: "1 Block" },
  { recipe_id: recipes[:mac_and_cheese].id, step_id: mac_cheese_step2.id, ingredient_id: ingredients[:cheese].id, amount: "Another Block" },
  { recipe_id: recipes[:mac_and_cheese].id, step_id: mac_cheese_step3.id, ingredient_id: ingredients[:cheese].id, amount: "All Blocks in Your House" },

  # water
  { recipe_id: recipes[:water_recipe].id, step_id: water_step1.id, ingredient_id: ingredients[:water].id, amount: "1" }
]

measurements.each do |measurement|
  Measurement.create(measurement)
end

# cookbooks --------------------------------------------------------------------

cookbooks_params = {
  amazing_apple_appetizers: { name: "Amazing Apple Appetizers", description: "OMG APPLES ARE AMAZING!!!!111!!!!", user_id: users[:apple_girl].id },
  food_for_thought: { name: "Food for Thought", description: "Think about this food before you eat it. Perhaps it will think back.", user_id: users[:gurl].id },
  everything_cheese: { name: "EVERYTHING CHEESE", description: "DID YOU NOT READ THE TITLE!!", user_id: users[:cheese_man].id },
  water_everything_you_can_cook_with_it: { name: "Water: Everything You Can Cook With It", description: "Water. The essence of life.", user_id: users[:cheese_man].id }
}

cookbooks = {}
cookbooks_params.each do |var_name, params|
  cookbooks[var_name] = Cookbook.create(params)
end

cookbooks[:amazing_apple_appetizers].recipes << recipes[:apple_crisp]
recipes.each_value do |object|
  cookbooks[:food_for_thought].recipes << object
end
cookbooks[:everything_cheese].recipes << recipes[:mac_and_cheese]
cookbooks[:water_everything_you_can_cook_with_it].recipes << recipes[:water_recipe]
