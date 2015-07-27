## Models
Ingredient
  name (unique, required)
  image (optional)
Recipe
  name (req, unique)
  desc (opt)
  img (opt)
  preparation (req)
Cookbook
  name (req)
  desc (opt)
  FK - user_id
User
  username (unique)
  pw (unique)

join table - with recipes & cookbooks

## Controllers
Ingredients
Recipes
Cookbooks
Users
Sessions
