users = [
  { username: "gurl", email: "gurl@example.com", password: "gurl", password_confirmation: "gurl", bio: "Just a midwest gurl." }
]

users.each do |user|
  User.create(user)
end

recipes = [
  { name: "Apple Crisp", description: "Yummy, cinnamony goodness!", user_id: User.first.id },
  { name: "Oreo Ice Cream", description: "Delicious on a hot day!", user_id: User.first.id },
  { name: "Brownies", description: "Delicious on a cold day!", user_id: User.first.id }
]

recipes.each do |recipe|
  Recipe.create(recipe)
end
