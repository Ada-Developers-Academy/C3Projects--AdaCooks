FactoryGirl.define do
  factory :user do
    username "gurl"
    email { "#{username}@example.com" }
    password "gurl"
    password_confirmation "gurl"
  end

  factory :recipe do
    name "Apple Crisp"
    user
  end

  factory :ingredient do
    name "Ingredient"
    user
  end

  factory :step do
    number 1
    directions "Here are directions."
    recipe
  end

  factory :measurement do
    amount "1/2 C"
    ingredient
    step
    recipe
  end

  factory :cookbook do
    name "How to Cook"
    description "You like know how to cook?"
    user
  end
end
