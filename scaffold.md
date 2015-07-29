## Models
Ingredient
  name (unique, required)
  image (optional)
Recipe
  has_and_belongs_to_many cookbooks (?)
  has_many ingredients
  name (req, unique)
  desc (opt)
  img (opt)
  preparation (req)
Cookbook
  has_many recipes (?)
  belongs_to user
  name (req)
  desc (opt)
  FK - user_id
User
  has_many cookbooks
  username (unique)
  pw (unique)

join table - with recipes & cookbooks

## Controllers
Ingredients
Recipes
Cookbooks
Users
Sessions
Home
