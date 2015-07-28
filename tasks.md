IDEAS
- Let's add seed data as we need it -- e.g. if I'm going to work on the ingredients controller, that'd be a good time to create the seed data for it.

TODO
- Fix rspec _IN PROGRESS: anw_ **PR OPENED**

## User Stories

### As any User, I can...
- search by the name of an Ingredient and get related Recipes back.
- __Recipes__
  - view an alphabetical list of all Recipes _IN PROGRESS: anw_
  - view the details of a Recipe, inluding...
    - a link to the User profile of the person who created the Recipe
    - links to the Ingridient profile for all associated Ingredients
- __Ingredients__
  - view an alphabetical list of all Ingedients
  - view the details of an individual Ingredient, including...
    - a list of links to Recipes associated with the Ingredient

### As an anonymous User I can...
- register a new User account
- Log In to an existing User account

### As a Logged In User I can...
- Log Out
- __Cookbooks__
  - See a list of Cookbooks I've already created, including...
    - The number of Recipes associated with the Cookbook
    - The number of unique Ingredients associated with the Cookbook
  - See the details of a specific Cookbook, including...
    - a list of links to the Recipes associated with the Cookbook
    - a link to remove (unassociate) a Recipe from the Cookbook. This does not destroy the Recipe.
  - Create a new Cookbook, associated with my User account, with...
    - a `name` (required)
    - a `description` (optional)
  - Destroy an existing Cookbook
    - Destroying a Cookbook __does not__ destroy the Recipes, just the associations.
  - Edit an existing Cookbook's `name` and `description` information.
- __Recipes__
  - Create a new Recipe, optionally associated with one of my existing Cookbooks, with...
    - a `name` (required)
    - a `description` (optional)
    - an uploaded image of the prepared Recipe (optional)
    - a `preparation` (required)
    - one or more Ingredients (required)
  - Edit an existing Recipe that I created by...
    - Changing the `name`, `description`, uploaded image, and/or `preparation`
    - Removing or Adding Ingredients
  - Destroy an existing Recipe that I created
    - Destroying a Recipe __does not__ destroy the Ingrdients, just the associations
  - From a Recipe's detail page, I can save the Recipe to an existing Cookbook
- __Ingredients__
  - Create an Ingredient with...
    - a unique `name` (required)
    - an uploaded image of the Ingredient (optional)
  - Edit the `name` and/or the uploaded image of an existing Ingredient that I created
  - Destroy an existing Ingredient that I created (this does not destroy any associated Recipes)

### Other Requirements
- A minimum 80% test coverage for all Models and Controllers.
