# users ------------------------------------------------------------------------
users_params = {
  gurl: { username: "gurl", email: "gurl@example.com", password: "gurl", password_confirmation: "gurl", bio: "Just a midwest gurl." }
}

users = {}
users_params.each do |var_name, params|
  users[var_name] = User.create(params)
end

# recipes ----------------------------------------------------------------------
recipes_params = {
  apple_crisp: { name: "Apple Crisp", description: "Yummy, cinnamony goodness!", user_id: users[:gurl].id },
  oreo_ice_cream: { name: "Oreo Ice Cream", description: "Delicious on a hot day!", user_id: users[:gurl].id },
  brownies: { name: "Brownies", description: "Delicious on a cold day!", user_id: users[:gurl].id }
}

recipes = {}
recipes_params.each do |var_name, params|
  recipes[var_name] = Recipe.create(params)
end

# ingredients ------------------------------------------------------------------
ingredients_params = {
  apples: { name: "Apples" },
  cinnamon: { name: "Cinnamon" },
  white_sugar: { name: "White Sugar" },
  rolled_oats: { name: "Rolled Oats" },
  olive_oil: { name: "Olive Oil" },
  milk: { name: "Milk" },
  oreos: { name: "Oreos" },
  vanilla: { name: "Vanilla Extract" },
  butter: { name: "Butter" },
  eggs: { name: "Eggs" },
  cocoa_powder: { name: "Unsweetend Cocoa Powder" },
  whole_wheat_flour: { name: "Whole Wheat Flour" },
  salt: { name: "Salt" },
  baking_powder: { name: "Baking Powder" },
  honey: { name: "Honey" },
  powdered_sugar: { name: "Powdered Sugar" }
}

ingredients = {}
ingredients_params.each do |var_name, params|
  ingredients[var_name] = Ingredient.create(params)
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
  { recipe_id: recipes[:brownies].id, step_id: brownies_step5.id, ingredient_id: ingredients[:powdered_sugar].id, amount: "1 C" }
]

measurements.each do |measurement|
  Measurement.create(measurement)
end
